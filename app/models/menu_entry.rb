class MenuEntry < ActiveRecord::Base
  belongs_to  :dish
  belongs_to  :private_menu
end
