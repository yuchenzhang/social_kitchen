class CreateLikeButtons < ActiveRecord::Migration
  def self.up
    create_table :like_buttons do |t|
      t.integer :liked_object_id
      t.string  :liked_object_class 
      t.timestamps
    end
  end

  def self.down
    drop_table :like_buttons
  end
end
