class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  
  def new
  end
  
  def create
    @picture = Picture.create( params[:picture] )
    redirect_to pictures_path
  end
end
