class Recipe < ActiveRecord::Base
  has_many  :required_ingredients
  has_many  :ingredients, :through => :required_ingredients
end
