RailsEmberModelEventssourceExample.TasksRoute = Ember.Route.extend
  model: (params)->
    RailsEmberModelEventssourceExample.Task.findAll()
