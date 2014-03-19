App = Ember.Application.create()


# put your routes here
App.IndexRoute = Ember.Route.extend(model: ->
  [
    "red"
    "yellow"
    "blue"
  ]
)