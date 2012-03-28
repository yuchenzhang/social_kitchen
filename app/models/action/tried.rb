class Action::Tried < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :dish
end
