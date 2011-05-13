class User < ActiveRecord::Base
  belongs_to :region
  has_many  :comments
  has_many  :dishes
  has_one   :private_menu
  has_and_belongs_to  :friends, :through => :friendship     
end
