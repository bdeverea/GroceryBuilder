class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.integer :item_id
      t.integer :recipe_id
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
