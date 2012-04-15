Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.IndexView extends Backbone.View
  template: JST["backbone/templates/wizards/index"]

  initialize: () ->
    @collection.on('reset', @addAll);
    @collection.on('change', @render);
    @collection.on('remove', @render);
    @collection.on('add', @render);
   
  addAll: () =>
    @collection.each(@addOne)
  
  addOne: (wizard) =>
    view = new Wizards.Views.Wizards.WizardView(model : wizard)
    @$("tbody").append(view.render().el)
       
  render: =>
    #not necessary to pass in collection anymore (all happens in addAll)
    $(@el).html(@template(@collection.toJSON()))
    @addAll()

    this
