Heap.Router = Em.Router.extend
  location: 'history'
  enableLogging: true

  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'heap'

    heaplog_index: Em.Route.extend
      route: '/:nickname'

      deserialize: (router,context)->
        Heap.User.withNickname(context.nickname)

      serialize: (router,context)->
        {nickname: context.get('nickname')}

      connectOutlets: (router, context)->
        defaultHeaplog = context.get('defaultHeaplog')
        router.get('applicationController').connectOutlet('sidebar', 'heaplogSidebar', defaultHeaplog)

    heaplog: Em.Route.extend
      route: '/:nickname/:short_name'
