class Api::V1::TouristSitesController < ApplicationController
  def index
    tourist_sites = TouristSitesFacade.new.sites_by_country(params[:country])
    # render json: RecipeSerializer.new(searched_recipes)
  end
end