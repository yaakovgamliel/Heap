describe 'Ember.js', ->
  it 'is the expected version', ->
    expect(Ember.VERSION).toEqual('1.0.0-pre.2')

describe 'Ember.js Data API', ->
  it 'is the expected version', ->
    expect(DS.CURRENT_API_REVISION).toEqual(9)
