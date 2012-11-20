#= require application

describe 'window.Heap', ->
  it 'is defined', ->
    expect(window.Heap).toBeDefined()

  it 'is an Ember.Applcation', ->
    expect(window.Heap.toString()).toEqual('Heap')
