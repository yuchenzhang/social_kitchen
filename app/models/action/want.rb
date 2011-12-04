class Action::Want < ActiveRecord::Base
  belongs_to  :user, :class_name => "Action::Want", :foreign_key => :subject_id
  belongs_to  :dish, :class_name => "Action::Want", :foreign_key => :object_id
end
