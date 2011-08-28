Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.IndexView extends Backbone.View
  template: JST["backbone/templates/wizards/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render');
    
    @options.wizards.bind('reset', this.addAll);
    @options.wizards.bind('change', this.render);
    @options.wizards.bind('remove', this.render);
    @options.wizards.bind('add', this.render);
   
  addAll: () ->
    @options.wizards.each(this.addOne)
  
  addOne: (wizard) ->
    view = new Wizards.Views.Wizards.WizardView({model : wizard})
    this.$("tbody").append(view.render().el)
       
  render: ->
    $(this.el).html(this.template(wizards: this.options.wizards.toJSON() ))
    @addAll()
    
    return this
