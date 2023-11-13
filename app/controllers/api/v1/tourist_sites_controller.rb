class Api::V1::TouristSitesController < ApplicationController
  def index
    tourist_sites = TouristSitesFacade.new.tourist_sites(params[:country])
    render json: TouristSiteSerializer.new(tourist_sites)
  end
end