#= require handlebars
#= require jquery
#= require ember
#= require ember-data
#= require bootstrap
#= require_self
#= require heap

window.Heap = Ember.Application.create
  ready: ->
    # I know I shouldn't be explicitly creating a store, but I don't know what
    # the solution is :(
    Heap.set('store', Heap.Store.create())
    Heap.preserializedObjectLoader()
    Heap.preserializedCurrentUserLoader()
