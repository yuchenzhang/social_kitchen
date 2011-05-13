class Dish < ActiveRecord::Base
  has_one     :recipe
  has_many    :ingredients, :through => :recipe
  belongs_to  :category, :class_name => "DishCategory"
end
