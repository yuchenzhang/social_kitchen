class Restaurant < ActiveRecord::Base
  has_many :dishes
  has_many  :logos, :class_name => "::Images::Logo", :foreign_key => :owner_id
end
