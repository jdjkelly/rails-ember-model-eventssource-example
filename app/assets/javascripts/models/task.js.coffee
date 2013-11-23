# for more details see: http://emberjs.com/guides/models/defining-models/

RailsEmberModelEventssourceExample.Task = Ember.Model.extend
  name:  Ember.attr()
  state: Ember.attr()

RailsEmberModelEventssourceExample.Task.reopenClass
  camelizeKeys: true
  url: '/tasks'
  rootKey: 'task'
  collectionKey: 'tasks'
  adapter: Ember.RESTAdapter.create()
