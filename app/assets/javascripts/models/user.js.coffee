user = DS.Model.extend
  heaplogs:    DS.hasMany('Heap.Heaplog')

  name:        DS.attr 'string'
  nickname:    DS.attr 'string'
  location:    DS.attr 'string'
  image:       DS.attr 'string'
  description: DS.attr 'string'
  extraUrl:    DS.attr 'string'
  provider:    DS.attr 'string'

  nicknameWithAt: (->
    "@#{@get('nickname')}"
  ).property('nickname')

  defaultHeaplog: (->
    console.log "Looking for default heaplogs"
    defaultLogs = @get('heaplogs').filterProperty('isDefault')
    return defaultLogs.get('firstObject') if defaultLogs.get('length') > 0

    console.log "Looking for any heaplogs"
    console.log "All heaplogs: #{@get('heaplogs.length')}"
    @get('heaplogs').get('firstObject') if @get('heaplogs.length') > 0
  ).property('heaplogs')

user.reopenClass
  withNickname: (nickname)->
    # Look in the local store first...
    matchingUsers = Heap.store.filter user, (data)->
      data.get('nickname') == nickname
    return matchingUsers.get('lastObject') if matchingUsers.get('length') > 0

    # Then query the remote server...
    matchingUsers = Heap.store.find user, {nickname: nickname}
    return matchingUsers.get('lastObject') if matchingUsers.get('length') > 0

Heap.User = user
