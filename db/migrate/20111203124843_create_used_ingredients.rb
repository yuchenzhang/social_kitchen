class CreateUsedIngredients < ActiveRecord::Migration
  def change
    create_table :used_ingredients do |t|
      t.integer :ingredient_id
      t.integer :dish_id
      t.timestamps
    end
  end
end
