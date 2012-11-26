#= require application

describe 'Heap.User', ->

  beforeEach ->
    Heap.store = Heap.Store.create
      adapter:  DS.FixtureAdapter.create()
    Ember.run.begin()

  afterEach ->
    Ember.run.end()

  describe 'Heap.User.withNickname', ->
    data =
      id: 1
      name: 'The Correct User'
      nickname: 'my_nickname'

    describe 'When the user is already present in the store', ->
      beforeEach ->
        Heap.store.load Heap.User, data

      it 'finds a user by nickname', ->
        expected_user = Heap.User.withNickname(data.nickname)
        expect(expected_user.get('name')).toEqual(data.name)

    describe 'When the user is not present in the store', ->
      beforeEach ->
        Heap.User.FIXTURES = [data]

      it 'loads the fixtures', ->
        expected_user = Heap.User.find(data.id)
        expect(expected_user.get('name')).toEqual(data.name)

      it 'finds a user by nickname', ->
        expected_user = Heap.User.withNickname(data.nickname)
        expect(expected_user.get('name')).toEqual(data.name)

  describe 'Heap.User#defaultHeaplog', ->
    user =
      id: 1
      name: 'Some User'
      nickname: 'some_nickname'

    heaplog1 =
      id: 1
      name: 'My first heaplog'
      nickname: 'first_log'

    heaplog2 =
      id: 2
      name: 'My second heaplog'
      nickname: 'second_log'

    describe 'when the user has only one log', ->
      it 'returns the only heaplog', ->
        user.heaplogs = [1]

        Heap.User.FIXTURES = [user]
        Heap.Heaplog.FIXTURES = [heaplog2]

        user_model = Heap.User.find(Heap.User, user.id)
        expect(user_model.get('defaultHeaplog').get('id')).toEqual(heaplog2.id)

    describe 'when the user has multiple logs and no default', ->
      it 'returns the default heaplog', ->
        user.heaplogs = [1,2]
        heaplog2.default = true
        
        Heap.User.FIXTURES = [user]
        Heap.Heaplog.FIXTURES = [heaplog1,heaplog2]

        user_model = Heap.User.find(Heap.User, user.id)
        expect(user_model.get('defaultHeaplog').get('id')).toEqual(heaplog2.id)
