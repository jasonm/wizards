Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.NewView extends Backbone.View    
  template: JST["backbone/templates/wizards/new"]
  
  events:
    "submit #new-wizard": "save"

  initialize: ->
    @model = new @collection.model()
    @model.on("change errors", @render) #change:errors

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(),
      success: (model) =>
        @model = model
        Backbone.history.navigate("/#{@model.get('id')}", true)
        #window.location.hash = "/#{@model.id}"
        
      error: @handleError
    )
    
  render: =>
    $(@el).html(@template(@model.toJSON()))
    @$("form").backboneLink(@model)
    
    return this

  handleError: (wizard, response) =>
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      ## will @model even be set?
      @model.set(errors: errors)
