Heap.FakeModel = DS.Model.extend
  name: DS.attr('string')

describe 'Preserialized Object Loaders', ->

  beforeEach ->
    store = Heap.Store.create
      adapter:  DS.FixtureAdapter.create
        simulateRemoteResponse: false
    Heap.set('store', store)
    DS.set('defaultStore', store)
    Ember.run.begin()

  afterEach ->
    Ember.run.end()

  describe 'Heap.preserializedObjectLoader', ->
    
    it 'exists', ->
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
        expected_model = Heap.store.find(Heap.FakeModel, fm1.id)
        expect(expected_model.get('name')).toEqual(fm1.name)

      it 'loads the second fake model', ->
        Heap.preserializedObjectLoader(data)
        expected_model = Heap.store.find(Heap.FakeModel, fm2.id)
        expect(expected_model.get('name')).toEqual(fm2.name)


  describe 'Heap.currentUserLoader', ->
    data = 
      user:
        id: 1
        name: 'Current Test User'
    
    it 'exists', ->
      expect(Heap.preserializedCurrentUserLoader).toBeDefined()

    it 'loads the user model into the store', ->
      Heap.preserializedCurrentUserLoader(data)
      expected_model = Heap.store.find(Heap.User, data.user.id)
      expect(expected_model.get('name')).toEqual(data.user.name)

    it 'sets Heap.currentUser to the User model', ->
      Heap.preserializedCurrentUserLoader(data)
      expected_model = Heap.store.find(Heap.User, data.user.id)
      expect(Heap.get('currentUser')).toEqual(expected_model)

