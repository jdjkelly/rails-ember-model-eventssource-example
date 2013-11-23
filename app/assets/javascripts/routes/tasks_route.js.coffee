RailsEmberModelEventssourceExample.TasksRoute = Ember.Route.extend
  model: (params)->
    RailsEmberModelEventssourceExample.Task.findAll()

  afterModel: (tasks, transition)->
    source = new EventSource("/tasks/events")
    source.addEventListener "tasks.update", (e) ->
      data = JSON.parse e.data

      record = RailsEmberModelEventssourceExample.Task.find(data.task.id)
      record.setProperties data.task
