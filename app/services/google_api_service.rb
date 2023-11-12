class GoogleApiService

  
  def video_search(q)
    get_url("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&maxResults=1&q=#{q}&key=#{Rails.application.credentials.googleapi[:api_key]}")[:items]
  end
# 
  def get_url(url)
    response = connection.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://youtube.googleapis.com") 
  end
end

