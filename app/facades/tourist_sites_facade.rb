class TouristSitesFacade
  def initialize
    @country_service = CountryService.new
    @places_service = PlacesService.new
  end

  def tourist_sites(search_data)
    country = @country_service.by_search(search_data)
    country_o = Country.new(country)
    if country_o.capital_info != nil
      sites = @places_service.tourist_sights(country_o.capital_info[1], country_o.capital_info[0]).map do |tourist_sites|
        TouristSite.new(tourist_sites)
      end
    else
      data = []
    end
  end
end