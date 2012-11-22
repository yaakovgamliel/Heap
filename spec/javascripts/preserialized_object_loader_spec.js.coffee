#= require application

Heap.FakeModel = DS.Model.extend
  name: DS.attr('string')

describe 'Heap.preserializedObjectLoader', ->
  
  beforeEach ->
    Heap.store = DS.Store.create
      revision: 4
      adapter:  DS.FixtureAdapter.create()
    Ember.run.begin()

  afterEach ->
    Ember.run.end()

  it 'should exist', ->
    expect(Heap.preserializedObjectLoader).toBeDefined()

  describe 'singular model', ->
    data =
      fake_model:
        id: 1
        name: 'Test Name'

    it 'loads a single model', ->
      Heap.preserializedObjectLoader(data)
      expected_model = Heap.store.find(Heap.FakeModel, 1)
      expect(expected_model.get('name')).toEqual('Test Name')

  describe 'multiple models', ->
    fm1 =
      id: 1
      name: 'Fake Model 1'
    fm2 =
      id: 2
      name: 'Fake Model 2'
    data =
      fake_models: [fm1, fm2]

    it 'loads the first fake model', ->
      Heap.preserializedObjectLoader(data)
      expected_model = Heap.store.find(Heap.FakeModel, fm1['id'])
      expect(expected_model.get('name')).toEqual(fm1['name'])

    it 'loads the second fake model', ->
      Heap.preserializedObjectLoader(data)
      expected_model = Heap.store.find(Heap.FakeModel, fm2['id'])
      expect(expected_model.get('name')).toEqual(fm2['name'])
