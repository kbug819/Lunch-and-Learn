
require 'rails_helper'
describe RecipeFacade do
  it '#recipe_search - provides an array of all recipes by given country' do
    VCR.use_cassette('recipe_search_Thailand') do
      recipe_list = RecipeFacade.new.recipe_search("Thailand")
      expect(recipe_list[0]).to be_a Recipe
      expect(recipe_list[0].country).to eq("Thailand")
    end
  end
  
  it '#if no country is passed through, will find a random country with country api' do
    VCR.use_cassette('recipe_search_random', record: :all) do
      recipe_list = RecipeFacade.new.recipe_search("")
      if recipe_list == []
        expect(recipe_list).to eq([])
      else
        expect(recipe_list[0]).to be_a Recipe
        expect(recipe_list[0].id).to be nil
      end
    end
  end
end