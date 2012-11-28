#= require handlebars
#= require jquery
#= require ember
#= require ember-data
#= require bootstrap
#= require_self
#= require heap

window.Heap = Ember.Application.create
  storeBinding: 'router.store'
  ready: ->
    Heap.preserializedObjectLoader()
    Heap.preserializedCurrentUserLoader()
