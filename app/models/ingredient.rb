class Ingredient < ActiveRecord::Base
  has_many  :used_ingredients, :dependent => :destroy
  has_many  :dishes, :through => :used_ingredients
end
