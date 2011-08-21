Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.ShowView extends Backbone.View
  template: JST["backbone/templates/wizards/show"]
   
  initialize: () ->
    _.bindAll(this, 'render');
    
    @options.model.bind('change', this.render);

  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))
    return this
