class CreateWizards < ActiveRecord::Migration
  def change
    create_table :wizards do |t|
      t.string :name
      t.integer :wiseness

      t.timestamps
    end
  end
end
