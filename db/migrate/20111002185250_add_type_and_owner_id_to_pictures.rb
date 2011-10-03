class AddTypeAndOwnerIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :type, :string
    add_column :pictures, :owner_id, :integer
  end
end
