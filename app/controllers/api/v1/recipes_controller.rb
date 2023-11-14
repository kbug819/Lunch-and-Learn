class Api::V1::RecipesController < ApplicationController
  def index
    searched_recipes = RecipeFacade.new.recipe_search(params[:country])
    if searched_recipes == "No Country Found"
      error = Error.new("No Country Found")
      render json: ErrorSerializer.new(error), status: 400
    else
      render json: RecipeSerializer.new(searched_recipes)
    end
  end
end