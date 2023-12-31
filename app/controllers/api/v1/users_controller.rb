class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    if new_user.save 
      new_user.update_columns(api_key: SecureRandom.urlsafe_base64)
      render json: UserSerializer.new(new_user), status: :created
    else
      render json: { errors: new_user.errors.full_messages }, status: :unprocessable_entity
    end

  end

  private 

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end