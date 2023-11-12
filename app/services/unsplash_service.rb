class UnsplashService
  def image_search(q)
    get_url("/search/photos?page=1&query=#{q}")[:results].first(10)
  end

  def get_url(url)
    response = connection.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.unsplash.com", params: {"client_id" => Rails.application.credentials.unsplash[:client_id]})
  end

end