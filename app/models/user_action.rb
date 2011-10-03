class UserAction < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :foodie
  
  validates_presence_of :user_id, :message => "can't be blank"
  validates_presence_of :foodie_id, :message => "can't be blank"
end
