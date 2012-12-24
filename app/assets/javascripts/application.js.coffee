#= require handlebars
#= require jquery
#= require moment
#= require ember
#= require ember-data
#= require ratchet/popover
#= require ratchet/slider
#= require ratchet/tabs
#= require ratchet/toggle
#= require_self
#= require heap

window.Heap = Ember.Application.create
  currentUser: null
  ready: ->
    # I know I shouldn't be explicitly creating a store, but I don't know what
    # the solution is :(
    Heap.set('store', Heap.Store.create())
    Heap.preserializedObjectLoader()
    Heap.preserializedCurrentUserLoader()
