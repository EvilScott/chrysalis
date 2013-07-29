Chrysalis.Views.PullRequests ||= {}

class Chrysalis.Views.PullRequests.PullRequestView extends Backbone.View
  template: JST["backbone/templates/pull_requests/pull_request"]

  events:
    "click .rebuild" : "rebuild"

  tagName: "tr"

  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo @model, 'remove', @remove
    @listenTo @model, 'destroy', @remove

  remove: =>
    @$el.empty()

  rebuild: ->
    @model.rebuild()
    return false

  render: =>
    @$el.html(@template(@model.toJSON() ))
    return this
