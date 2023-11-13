class Api::V1::TouristSitesController < ApplicationController
  def index
    tourist_sites = TouristSitesFacade.new.tourist_sites(params[:country])
    render json: TouristSitesSerializer.new(tourist_sites)
  end
end