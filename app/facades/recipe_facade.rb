class RecipeFacade
  def initialize
    @service = RecipeService.new
  end

  def recipe_search(search_data)
    if search_data.empty? || search_data == "random"
      country = CountryFacade.new.random_country.name
      recipes = @service.recipe_search(country).map do |recipe|
        Recipe.new(recipe, country)
      end
    else
      recipes = @service.recipe_search(search_data).map do |recipe|
        Recipe.new(recipe, search_data)
      end
    end
  end
end