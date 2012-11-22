#= require inflection

isPlural = (what)->
  (what == what.pluralize()) && (what != what.singularize())

Heap.preserializedObjectLoader = (data=window.preserializedObjects)->
  if data?
    for key,value of data
      loaderMethod = 'load'
      loaderMethod += 'Many' if isPlural(key)
      model = Heap[key.singularize().classify()]
      Heap.store[loaderMethod](model, value)
