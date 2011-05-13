class PrivateMenu < ActiveRecord::Base
  has_many  :menu_entries
  has_many  :dishes, :through => :menu_entries
end
