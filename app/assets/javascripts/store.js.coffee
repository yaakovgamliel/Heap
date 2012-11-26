Heap.Store = DS.Store.extend
  revision: 8
  adapter: DS.RESTAdapter.create()

Heap.store = Heap.Store.create()
