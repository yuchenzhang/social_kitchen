class DishesController < ApplicationController
  def index
    @dishes = User.find(params[:user_id].to_i).dishes    
    ActiveRecord::Base.include_root_in_json = false
    render :json => @dishes.map(&:to_json)
  end
  
  def new
    @dish = Dish.new(:user_id => params[:user_id].to_i)
  end
  
  def create
    Dish.create!(params[:dish])
    render :text => "ok"
  end
end