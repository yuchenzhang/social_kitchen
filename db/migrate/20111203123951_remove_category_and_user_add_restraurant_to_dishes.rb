class RemoveCategoryAndUserAddRestraurantToDishes < ActiveRecord::Migration
  def up
    remove_column :dishes, :category_id
    remove_column :dishes, :region_id
    add_column  :dishes, :restaurant_id, :integer
  end

  def down
    add_column :dishes, :category_id, :integer
    add_column :dishes, :region_id, :integer
    remove_column :dishes, :restaurant_id
  end
end
