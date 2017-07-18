class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :glass
      t.string :category
      t.string :garnish
      t.text :preparation
      t.text :ingredients
      t.text :amounts
      t.text :units
      t.timestamps
    end
  end
end
