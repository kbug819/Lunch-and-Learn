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
# https://api.edamam.com/api/recipes/v2?type=public&q=Thailand&app_id=f963c704&app_key=83333df30fcea0a80f6eba059cf38612