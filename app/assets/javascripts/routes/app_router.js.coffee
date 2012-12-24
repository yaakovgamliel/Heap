Heap.Router = Em.Router.extend
  location: 'history'
  enableLogging: true

  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'heap'

    heaplogs: Em.Route.extend
      route: '/:nickname'

      deserialize: (router,context)->
        Heap.User.withNickname(context.nickname)

      serialize: (router,context)->
        {nickname: context.get('nickname')}

      connectOutlets: (router, user)->
        defaultHeaplog = user.get('defaultHeaplog')
        appController = router.get('applicationController')
        console.log defaultHeaplog
        if defaultHeaplog?
          appController.connectOutlet('banner', 'heaplogBanner', defaultHeaplog)
          appController.connectOutlet('page', 'heaplog', defaultHeaplog)
        else
          appController.connectOutlet('banner', 'userBanner', user)
          appController.connectOutlet('page', 'newHeaplog', user)
