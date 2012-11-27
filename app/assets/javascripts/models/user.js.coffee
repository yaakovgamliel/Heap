user = DS.Model.extend
  heaplogs:    DS.hasMany('Heap.Heaplog')

  name:        DS.attr 'string'
  nickname:    DS.attr 'string'
  location:    DS.attr 'string'
  image:       DS.attr 'string'
  description: DS.attr 'string'
  extra_url:   DS.attr 'string'

  defaultHeaplog: (->
    defaultLogs = @get('heaplogs').filterProperty('isDefault')
    return defaultLogs.get('firstObject') if defaultLogs.get('length') > 0

    @get('heaplogs').get('firstObject') if @get('heaplogs').get('length') > 0
  ).property('heaplogs')

user.reopenClass
  withNickname: (nickname)->
    # Look in the local store first...
    matching_users = Heap.store.filter user, (data)->
      data.get('nickname') == nickname
    return matching_users.get('lastObject') if matching_users.get('length') > 0

    # Then query the remote server...
    matching_users = Heap.store.find user, {nickname: nickname}
    return matching_users.get('lastObject') if matching_users.get('length') > 0

Heap.User = user
