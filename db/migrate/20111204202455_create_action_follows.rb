class CreateActionFollows < ActiveRecord::Migration
  def change
    create_table :action_follows do |t|
      t.integer :subject_id
      t.integer :object_id
      t.timestamps
    end
  end
end
