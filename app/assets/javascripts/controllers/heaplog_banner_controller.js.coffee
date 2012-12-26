Heap.HeaplogBannerController = Em.Controller.extend
  nameBinding: 'content.name'
  descriptionBinding: 'content.description'
  bannerUrlBinding: 'content.bannerUrl'
  userImageUrlBinding: 'content.user.image'
  userNameBinding: 'content.user.name'
  cssStyleAdditions: (->
    if @get('bannerUrl')
      "background-image: url(#{@get('bannerUrl')});"
    else
      ''
  ).property('bannerUrl')
