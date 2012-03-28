class Action::Follow < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :foreign_key => :user_id_follower
  belongs_to :followed, :class_name => "User", :foreign_key => :user_id_followed
end
