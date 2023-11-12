class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :created
    else
      error = ErrorLogin.new("Bad credentials, please try again", 'Bad Credentials', 404)
      render json: ErrorSerializer.new(error), status: 404
    end
  end

end