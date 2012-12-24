Heap.Store = DS.Store.extend
  revision: 4
  adapter: DS.RESTAdapter.create()
  mappings:
    posts: Heap.Post
    heaplogs: Heap.Heaplog
    users: Heap.User
