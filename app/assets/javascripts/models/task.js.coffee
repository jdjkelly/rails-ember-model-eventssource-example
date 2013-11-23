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


jQuery(document).ready ->
  setTimeout (->
    source = new EventSource("/tasks/events")
    source.addEventListener "tasks.update", (e) ->
      data = JSON.parse e.data

      if data.task?
        record = RailsEmberModelEventssourceExample.Task.find(data.task.id)
        record.setProperties
          name: data.task.name
          state: data.task.state
  ), 1
