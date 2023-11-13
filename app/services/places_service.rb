class PlacesService
  
  def tourist_sights(long, lat)
    get_url("/v2/places?apiKey=#{Rails.application.credentials.geoapify.api_key}&categories=tourism.sights&filter=circle:#{long},#{lat},1000")
  end
  
  def test_connection
    get_url("/v2/places?apiKey=#{Rails.application.credentials.geoapify.api_key}&categories=catering.restaurant&conditions=vegetarian&filter=rect:-73.99331143343392,40.77129742280923,-73.97215311088917,40.757134681430635&limit=20")
  end

  def get_url(url)
    response = connection.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.geoapify.com")
  end
end