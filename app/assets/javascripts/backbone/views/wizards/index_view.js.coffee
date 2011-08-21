Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.IndexView extends Backbone.View
  template: JST["backbone/templates/wizards/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');
    
    @options.wizards.bind('reset', this.addAll);
   
  addAll: () ->
    @options.wizards.each(this.addOne)
  
  addOne: (wizard) ->
    view = new Wizards.Views.Wizards.WizardView({model : wizard})
    this.$("tbody").append(view.render().el)
       
  render: ->
    $(this.el).html(this.template(wizards: this.options.wizards.toJSON() ))
    @addAll()
    
    return this