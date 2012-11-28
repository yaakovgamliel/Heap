Heap.Heaplog = DS.Model.extend
  
  user:        DS.belongsTo 'Heap.User'
  # posts:       DS.hasMany('Heap.Post')

  stub:        DS.attr('string')
  name:        DS.attr('string')
  description: DS.attr('string')
  public:      DS.attr('boolean')
  isDefault:   DS.attr('boolean')
