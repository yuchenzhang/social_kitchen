class Foodie < ActiveRecord::Base
  has_many  :pictures, :conditions => {:type => ["FoodiePicture"]}, :foreign_key => :owner_id
  
end
