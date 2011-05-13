class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.integer :dish_id
      t.text    :article
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
