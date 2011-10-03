class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.integer :user_id
      t.integer :foodie_id
      t.string :type

      t.timestamps
    end
  end
end
