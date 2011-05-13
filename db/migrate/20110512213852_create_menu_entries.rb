class CreateMenuEntries < ActiveRecord::Migration
  def self.up
    create_table :menu_entries  do |t|
      t.integer :dish_id
      t.integer :private_menu_id
      t.timestamps
    end
  end

  def self.down
    drop_table :menu_entries
  end
end
