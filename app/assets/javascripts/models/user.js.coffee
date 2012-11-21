Heap.User = DS.Model.extend

  heaplogs:    DS.hasMany('Heap.Heaplog')

  name:        DS.attr 'string'
  nickname:    DS.attr 'string'
  location:    DS.attr 'string'
  image:       DS.attr 'string'
  description: DS.attr 'string'
  extra_url:   DS.attr 'string'

