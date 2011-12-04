class CreateActionWants < ActiveRecord::Migration
  def change
    create_table :action_wants do |t|
      t.integer :subject_id
      t.integer :object_id
      t.timestamps
    end
  end
end
