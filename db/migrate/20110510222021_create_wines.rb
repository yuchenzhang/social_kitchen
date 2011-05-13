class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines do |t|
      t.string  :name
      t.integer :region_id
      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end
