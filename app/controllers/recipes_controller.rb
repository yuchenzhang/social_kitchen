class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id].to_i, :joins => :dish, :select => "recipes.*, dishes.*")
    respond_to do |format| 
      format.html 
      format.xml { render :xml => @recipe.to_xml }
      format.json { render :json => @recipe.to_json } 
    end
  end
end
