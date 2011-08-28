class WizardObserver < ActiveRecord::Observer
  include BackboneSync::Rails::Faye::Observer
end
