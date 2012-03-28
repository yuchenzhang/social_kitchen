class CreateActionTrieds < ActiveRecord::Migration
  def change
    create_table :action_trieds do |t|
      t.integer :user_id
      t.integer :dish_id

      t.timestamps
    end
  end
end
