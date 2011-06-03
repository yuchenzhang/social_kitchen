class DishesController < ApplicationController
  def index
    @dishes = Dish.all    
    ActiveRecord::Base.include_root_in_json = false
    render :json => @dishes.map(&:to_json)
  end
  
end