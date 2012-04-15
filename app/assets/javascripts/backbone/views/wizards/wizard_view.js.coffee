Wizards.Views.Wizards ||= {}

class Wizards.Views.Wizards.WizardView extends Backbone.View
  template: JST["backbone/templates/wizards/wizard"]
  tagName: "tr"
  
  events:
    "click .destroy" : "destroy"
      
  
  destroy: =>
    @model.destroy()
    @remove()
    
    return false
    
  render: =>
    $(@el).html(@template(@model.toJSON()))
    return this