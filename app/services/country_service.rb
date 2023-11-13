class CountryService
  
  def by_search(country)
    get_url("/v3.1/name/#{country}")[0]
  end

  def get_all
    get_url("/v3.1/all")
  end

  def get_url(url)
    response = connection.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://restcountries.com")
  end
end