class RecipeService
  
  def recipe_search(q)
    get_url("/api/recipes/v2?type=public&q=#{q}&app_id=#{Rails.application.credentials.edamam[:app_id]}&app_key=#{Rails.application.credentials.edamam[:app_key]}")[:hits]
  end
# 
  def get_url(url)
    response = connection.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.edamam.com") 
  end
end
