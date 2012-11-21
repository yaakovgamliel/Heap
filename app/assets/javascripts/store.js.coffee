Heap.Store = DS.Store.extend
  revision: 4
  adapter: DS.RESTAdapter.create()

Heap.store = Heap.Store.create()
