class CreateRequiredIngredients < ActiveRecord::Migration
  def self.up
    create_table :required_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :quantity
      t.string  :unit
      t.timestamps
    end
  end

  def self.down
    drop_table :required_ingredients
  end
end
