class Wizard < ActiveRecord::Base
  validates :name, :wiseness, :presence => true
  validates :name, :uniqueness => true
end
