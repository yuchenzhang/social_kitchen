class Ingredient < ActiveRecord::Base
  has_many  :required_ingredients
  has_many  :recipes, :through => :required_ingredients
end
