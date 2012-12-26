Heap.UserBannerController = Em.Controller.extend
  nameBinding: 'content.name'
  descriptionBinding: 'content.description'
  bannerUrlBinding: 'content.image'
  imageUrlBinding: 'content.image'
  nicknameBinding: 'content.nickname'
  cssStyleAdditions: (->
    if @get('bannerUrl')
      "background-image: url(#{@get('bannerUrl')});"
    else
      ''
  ).property('bannerUrl')
