class Recipe
  attr_reader :id, :title, :url, :country, :image_url
  def initialize(recipe_data, country)
    @id = nil
    @title = recipe_data[:recipe][:label]
    @url = recipe_data[:recipe][:url]
    @country = country
    @image_url = recipe_data[:recipe][:image]
  end
end