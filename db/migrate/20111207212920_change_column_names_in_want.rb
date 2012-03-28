class ChangeColumnNamesInWant < ActiveRecord::Migration
  def up
    rename_column :action_wants, :subject_id, :user_id
    rename_column :action_wants, :object_id,  :dish_id
  end

  def down
    rename_column :action_wants, :user_id, :subject_id
    rename_column :action_wants, :dish_id, :object_id
  end
end
