class Wizards.Routers.WizardsRouter extends Backbone.Router
  routes:
    "new": "newWizard"
    "index": "index"
    ":id/edit": "edit"
    ":id": "show"
    "": "index"

  initialize: (options) ->
    @wizards = new Wizards.Collections.WizardsCollection()
    new BackboneSync.RailsFayeSubscriber(@wizards, channel: 'wizards', client:options.client)
    @wizards.reset options.wizards

  # methods
  newWizard: ->
    @view = new Wizards.Views.Wizards.NewView(collection: @wizards)
    $("#wizards").html(@view.render().el)

  #pages

  index: ->
    @view = new Wizards.Views.Wizards.IndexView(collection: @wizards)
    $("#wizards").html(@view.render().el)

  show: (id) ->
    wizard = @wizards.get(id)
    
    @view = new Wizards.Views.Wizards.ShowView(model: wizard)
    $("#wizards").html(@view.render().el)
    
  edit: (id) ->
    wizard = @wizards.get(id)

    @view = new Wizards.Views.Wizards.EditView(model: wizard)
    $("#wizards").html(@view.render().el)
  
