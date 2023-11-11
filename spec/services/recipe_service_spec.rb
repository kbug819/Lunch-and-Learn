
require 'rails_helper'

describe RecipeService do
  it 'returns an array of all countries' do
    search_term = "Thailand"
    VCR.use_cassette("recipe_search_#{search_term}") do
      recipe_search = RecipeService.new.recipe_search(search_term)
      expect(recipe_search).to be_an Array
      expect(recipe_search[0][:recipe]).to be_a Hash
      expect(recipe_search[0][:recipe][:label]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipe_search[0][:recipe][:uri]).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9")
      expect(recipe_search[0][:recipe][:image]).to be_a String  
    end
  end
end