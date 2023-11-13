require 'rails_helper'

describe "places API" do
  describe "search for tourist sites based on given country" do
    it "returns a list of tourist sites from a given country" do
      search_term = "France"
      VCR.use_cassette("tourist_sites") do

        get "/api/v1/tourist_sites?country=#{search_term}"
        expect(response).to be_successful

        sites = JSON.parse(response.body, symbolize_names: true)

        expect(recipes[:data]).to be_an Array
        expect(recipes[:data][0]).to be_a Hash
        expect(recipes[:data][0][:id]).to eq(nil)
        expect(recipes[:data][0][:type]).to eq("recipe")
        expect(recipes[:data][0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(recipes[:data][0][:attributes][:country]).to eq("#{search_term}")
        expect(recipes[:data][0][:attributes][:url]).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9")
      end
    end
    
    describe "random_search for country if no country is passed in" do
      it "returns a random country if no search term is entered" do
        search_term = ""
        VCR.use_cassette("recipe_search_#{search_term}", record: :all) do
  
          get "/api/v1/recipes?country=#{search_term}"
          recipes = JSON.parse(response.body, symbolize_names: true)
          if recipes[:data] == []
            expect(response).to be_successful
            expect(response.status).to eq 200
            expect(recipes).to eq({:data=>[]})
            expect(recipes[:data][0]).to eq(nil)

          else
            expect(response).to be_successful
            expect(recipes[:data]).to be_an Array
            expect(recipes[:data][0]).to be_a Hash
            expect(recipes[:data][0][:id]).to eq(nil)
            expect(recipes[:data][0][:type]).to eq("recipe")
            expect(recipes[:data][0][:attributes][:title]).to be_a String
            expect(recipes[:data][0][:attributes][:country]).to be_a String
            expect(recipes[:data][0][:attributes][:url]).to be_a String
          end
        end
      end
    end
  end
end