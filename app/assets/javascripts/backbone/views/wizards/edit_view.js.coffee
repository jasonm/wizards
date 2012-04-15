Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.EditView extends Backbone.View
  template: JST["backbone/templates/wizards/edit"]
  
  events:
    "submit #edit-wizard": "update"
    
  update: (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success:(model) =>
        @model = model
        Backbone.history.navigate("/#{@model.get('id')}", true)
        #window.location.hash = "/#{@model.get('id')}"
    )
    
  render: =>
    $(@el).html(@template(@model.toJSON() ))
    @$("form").backboneLink(@model) ##what is this?
    
    this
