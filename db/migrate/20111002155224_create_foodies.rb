class CreateFoodies < ActiveRecord::Migration
  def change
    create_table :foodies do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
