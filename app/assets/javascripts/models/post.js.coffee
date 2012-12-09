Heap.Post = DS.Model.extend

  heaplog:     DS.belongsTo('Heap.Heaplog')

  title:       DS.attr('string')
  stub:        DS.attr('string')
  body:        DS.attr('string')
  createdAt:   DS.attr('date')
  updatedAt:   DS.attr('date')
  # FIXME raise a github issue that dates appear to be in local even though they're 
  # serialized as UTC from the server. Check with IRC first.
  postedAt:    DS.attr('date')

  humanizedPostedAt: (->
    moment(@get('postedAt')).fromNow()
  ).property('postedAt')

  serializedPostedAt: (->
    @get('postedAt').toString()
  ).property('postedAt')

  authorBinding: 'heaplog.user'
  authorNameBinding: 'author.name'
  authorImageUrlBinding: 'author.image'
  authorNicknameBinding: 'author.nicknameWithAt'
