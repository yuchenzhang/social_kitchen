class UsersController < ApplicationController
  def new
  end
  
  def create
    User.create!(params[:user])
    render :text => "ok"
  end
end
