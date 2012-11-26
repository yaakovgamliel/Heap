#= require inflection

isPlural = (what)->
  (what == what.pluralize()) && (what != what.singularize())

loadOne = (model, data)->
  result = Heap.store.load(model, data)
  Heap.store.find(model, result.id) if result.id?

loadMany = (model, data)->
  Heap.store.loadMany(model, data)

Heap.preserializedObjectLoader = (data=window.preserializedObjects)->
  if data?
    for key,value of data
      model = Heap[key.singularize().classify()]
      if isPlural(key)
        loadMany(model, value)
      else
        loadOne(model, value)

Heap.preserializedCurrentUserLoader = (data=window.preserializedCurrentUser)->
  Heap.set('currentUser', loadOne(Heap.User,data.user)) if data? && data.user?
