class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourceFacade.new.by_country(params[:country])
    if resources == "No Country Found"
      error = ErrorLogin.new("No Country Found", 'Country Incorrect', 400)
      render json: ErrorSerializer.new(error), status: 400
    else
      render json: LearningResourceSerializer.new(resources)
    end
  end
end