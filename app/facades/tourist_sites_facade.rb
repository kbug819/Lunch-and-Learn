class TouristSitesFacade
  def initialize
    @country_service = CountryServiceService.new
    @places_service = PlacesService.new
  end

  def tourist_sites(search_data)
      country = @country_service.by_search(search_data)
      country_o = Country.new(country)
      @places_service.tourist_sights(country_o.capital_info[1], country_o.capital_info[0])
      

      recipes = @service.recipe_search(country).map do |recipe|
        Recipe.new(recipe, country)
      
    else
      recipes = @service.recipe_search(search_data).map do |recipe|
        Recipe.new(recipe, search_data)
      end
    end
  end
end