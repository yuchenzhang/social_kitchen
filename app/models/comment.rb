class Comment < ActiveRecord::Base
  has_many  :user_photos, :class_name => "::Images::UserPhoto", :foreign_key => :owner_id
  belongs_to  :user
  belongs_to  :dish
  
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :dish_id, :on => :create, :message => "can't be blank"
end
