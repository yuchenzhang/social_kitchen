class Recipe < ActiveRecord::Base
  has_many  :required_ingredients
  has_many  :ingredients, :through => :required_ingredients
  belongs_to  :dish, :include => true
end
