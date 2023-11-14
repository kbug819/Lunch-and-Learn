class CountryFacade
  def initialize()
    @service = CountryService.new
    @country_list = all_countries
  end

  def all
    @country_list ||= all_countries
  end 

  def random_country
    all.sample
  end

  def all_countries
    @service.get_all.map do |country|
      Country.new(country)
    end
  end

  def country_search(search_country)
    on_list = all.any? { |country| country.name == search_country  }
  end
end