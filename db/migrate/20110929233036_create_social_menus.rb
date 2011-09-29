class CreateSocialMenus < ActiveRecord::Migration
  def change
    create_table :social_menus do |t|

      t.timestamps
    end
  end
end
