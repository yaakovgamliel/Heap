Heap.HeaplogBannerController = Em.Controller.extend
  nameBinding: 'content.name'
  descriptionBinding: 'content.description'
  bannerUrlBinding: 'content.bannerUrl'
  userImageUrlBinding: 'content.user.image'
  userNameBinding: 'content.user.name'
  cssStyleAdditions: (->
    "background-image: url(#{@get('bannerUrl')});"
  ).property('bannerUrl')
