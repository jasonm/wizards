Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.ShowView extends Backbone.View
  template: JST["backbone/templates/wizards/show"]
   
  initialize: ->
    @model.on('change', @render);

  render: =>
    $(@el).html(@template(@model.toJSON()))
    return this
