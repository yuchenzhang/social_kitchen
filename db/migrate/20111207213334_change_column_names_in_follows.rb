class ChangeColumnNamesInFollows < ActiveRecord::Migration
  def up
    rename_column :action_follows, :subject_id, :user_id_follower
    rename_column :action_follows, :object_id,  :user_id_followed
  end

  def down
    rename_column :action_follows, :user_id_follower, :subject_id
    rename_column :action_follows, :user_id_followed, :object_id
  end
end
