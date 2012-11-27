#= require handlebars
#= require jquery
#= require ember
#= require ember-data
#= require bootstrap
#= require_self
#= require heap
#= require preserialized_object_loader

window.Heap = Ember.Application.create
  ready: ->
    Heap.store = Heap.Store.create()
    Heap.preserializedObjectLoader()
    Heap.preserializedCurrentUserLoader()
