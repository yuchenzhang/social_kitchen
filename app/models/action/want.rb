class Action::Want < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :dish
end
