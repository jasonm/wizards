class Wizards.Models.Wizard extends Backbone.Model
  #think we are sending data at the root
  ##paramRoot: 'wizard'

  defaults:
    name: null
    wiseness: null
  
class Wizards.Collections.WizardsCollection extends Backbone.Collection
  model: Wizards.Models.Wizard
  url: '/wizards'