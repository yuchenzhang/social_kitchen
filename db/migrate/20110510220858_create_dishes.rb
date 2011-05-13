class CreateDishes < ActiveRecord::Migration
  def self.up
    create_table :dishes do |t|
      t.string  :name, :limit =>40
      t.integer :region_id
      t.integer :category_id
      t.string  :description, :limit =>140
      t.timestamps
    end
  end

  def self.down
    drop_table :dishes
  end
end
