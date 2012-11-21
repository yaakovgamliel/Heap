Heap.Post = DS.Model.extend

  heaplog:     DS.belongsTo('Heap.Heaplog')

  title:       DS.attr('string')
  stub:        DS.attr('string')
  body:        DS.attr('string')
  created_at:  DS.attr('date')
  updated_at:  DS.attr('date')
  posted_at:   DS.attr('date')
