class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      user.favorites.create!(country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title])
      success = Success.new("Favorite added successfully")
      render json: SuccessSerializer.new(success), status: 201
    else
      error = ErrorLogin.new("Bad credentials, please try again", 'Bad Credentials', 404)
      render json: ErrorSerializer.new(error), status: 404
    end
  end
end
