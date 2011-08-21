Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.WizardView extends Backbone.View
  template: JST["backbone/templates/wizards/wizard"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @options.model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(this.template(this.options.model.toJSON() ))    
    return this