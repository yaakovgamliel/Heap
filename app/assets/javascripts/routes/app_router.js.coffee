Heap.Router = Em.Router.extend
  location: 'history'

  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'

    users: Em.Route.extend
      route: '/users'
      index: Em.Route.extend
        route: '/'

      show: Em.Route.extend
        route: '/:nickname'

    posts: Em.Route.extend
      route: '/posts'
      index: Em.Route.extend
        route: '/'

      show: Em.Route.extend
        route: '/:token'

    heaplogs: Em.Route.extend
      route: '/heaplogs'
      index: Em.Route.extend
        route: '/'

      show: Em.Route.extend
        route: '/:short_name'
