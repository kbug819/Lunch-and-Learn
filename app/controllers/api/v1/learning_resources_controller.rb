class Api::V1::LearningResourcesController < ApplicationController
  def index
    resources = LearningResourceFacade.new.by_country(params[:country])
    render json: LearningResourceSerializer.new(resources)
  end
end