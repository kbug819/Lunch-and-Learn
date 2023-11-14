class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user 
      favorites = user.favorites
      render json: FavoriteSerializer.new(favorites), status: :created
    else
      error = Error.new("Bad credentials, please try again")
      render json: ErrorSerializer.new(error), status: 400
    end
  end
  
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      user.favorites.create!(country: params[:country], recipe_link: params[:recipe_link], recipe_title: params[:recipe_title])
      success = Success.new("Favorite added successfully")
      render json: SuccessSerializer.new(success), status: 201
    else
      error = Error.new("Bad credentials, please try again")
      render json: ErrorSerializer.new(error), status: 400
    end
  end
  
  def destroy
    user = User.find_by(api_key: params[:api_key])
    u_favorite = Favorite.find_by(id: params[:id])
    if user
      if user.id == u_favorite.user_id
        Favorite.delete(u_favorite)
        success = Success.new("Favorite deleted")
        render json: SuccessSerializer.new(success), status: 201
      else
        error = Error.new("Bad credentials, please try again")
        render json: ErrorSerializer.new(error), status: 400
      end
    else
      error = Error.new("Bad credentials, please try again")
      render json: ErrorSerializer.new(error), status: 400
    end
  end

end
