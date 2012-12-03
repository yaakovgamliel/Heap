Heap.NewHeaplogController = Em.Controller.extend
  currentUserBinding: 'Heap.currentUser'
  userBinding: 'content'
  userNicknameBinding: 'content.nickname'
  newHeaplogName: null
  newHeaplogDescription: null
  newHeaplogShortName: null
  newHeaplogBannerUrl: null

  canCreateHeaplogForThisUser: (->
    @get('currentUser')? && (@get('currentUser') == @get('user'))
  ).property('currentUser', 'userBinding')
