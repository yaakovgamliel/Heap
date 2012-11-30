Heap.NewHeaplogController = Em.Controller.extend
  currentUserBinding: 'Heap.currentUser'
  userBinding: 'content'
  userNicknameBinding: 'content.nickname'
  canCreateHeaplogForThisUser: (->
    @get('currentUser')? && (@get('currentUser') == @get('user'))
  ).property('currentUser', 'userBinding')
