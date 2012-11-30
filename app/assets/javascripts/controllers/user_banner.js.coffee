Heap.UserBannerController = Em.Controller.extend
  nameBinding: 'content.name'
  descriptionBinding: 'content.description'
  bannerUrlBinding: 'content.image'
  imageUrlBinding: 'content.image'
  nicknameBinding: 'content.nickname'
  cssStyleAdditions: (->
    "background-image: url(#{@get('bannerUrl')});"
  ).property('bannerUrl')
