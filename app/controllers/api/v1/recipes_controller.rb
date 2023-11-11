class Api::V1::RecipesController < ApplicationController
  def index
    searched_recipes = RecipeFacade.new.recipe_search(params[:country])
    render json: RecipeSerializer.new(searched_recipes)
  end
end