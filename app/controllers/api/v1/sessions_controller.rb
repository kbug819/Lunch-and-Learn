class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :created
    else
      error = Error.new("Bad credentials, please try again")
      render json: ErrorSerializer.new(error), status: 400
    end
  end

end