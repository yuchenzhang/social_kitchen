class CreatePrivateMenus < ActiveRecord::Migration
  def self.up
    create_table :private_menus do |t|
      t.integer :user_id
      t.string  :name
      t.timestamps
    end
  end

  def self.down
    drop_table :private_menus
  end
end
