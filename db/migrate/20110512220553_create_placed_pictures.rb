class CreatePlacedPictures < ActiveRecord::Migration
  def self.up
    create_table :placed_pictures do |t|
      t.integer :picture_id
      t.integer :place_id
      t.string :place_type
      t.timestamps
    end
  end

  def self.down
    drop_table :placed_pictures
  end
end
