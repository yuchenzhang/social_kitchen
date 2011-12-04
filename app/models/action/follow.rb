class Action::Follow < ActiveRecord::Base
  belongs_to :follower, :class_name => "User", :foreign_key => :subject_id
  belongs_to :followed, :class_name => "User", :foreign_key => :object_id
end
