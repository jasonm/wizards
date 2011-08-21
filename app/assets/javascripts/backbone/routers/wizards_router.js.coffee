class Wizards.Routers.WizardsRouter extends Backbone.Router
  initialize: (options) ->
    @wizards = new Wizards.Collections.WizardsCollection()
    @wizards.subscribeToFayeUpdates('wizards')
    @wizards.reset options.wizards

  routes:
    "/new": "newWizard"
    "/index": "index"
    "/:id/edit": "edit"
    "/:id": "show"
    ".*": "index"

  newWizard: ->
    @view = new Wizards.Views.Wizards.NewView(collection: @wizards)
    $("#wizards").html(@view.render().el)

  index: ->
    @view = new Wizards.Views.Wizards.IndexView(wizards: @wizards)
    $("#wizards").html(@view.render().el)

  show: (id) ->
    wizard = @wizards.get(id)
    
    @view = new Wizards.Views.Wizards.ShowView(model: wizard)
    $("#wizards").html(@view.render().el)
    
  edit: (id) ->
    wizard = @wizards.get(id)

    @view = new Wizards.Views.Wizards.EditView(model: wizard)
    $("#wizards").html(@view.render().el)
  