require 'rails_helper'

describe "recipes API" do
  describe "search for a recipe based on a country" do
    it "returns a list of recipes associated with a searched country" do
      search_term = "thailand"
      VCR.use_cassette("recipe_search_term_#{search_term}") do

        get "/api/v1/recipes?country=#{search_term}"
        expect(response).to be_successful

        recipes = JSON.parse(response.body, symbolize_names: true)
        expect(recipes[:data]).to be_an Array
        expect(recipes[:data][0]).to be_a Hash
        expect(recipes[:data][0][:id]).to eq(nil)
        expect(recipes[:data][0][:type]).to eq("recipe")
        expect(recipes[:data][0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(recipes[:data][0][:attributes][:country]).to eq("#{search_term}")
        expect(recipes[:data][0][:attributes][:url]).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
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

    describe "random_search for country if 'random' is passed in'" do
      it "returns a random country if no search term is entered" do
        search_term = "random"
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

    describe "random_search for country if 'random' is passed in'" do
      it "returns a random country if no search term is entered" do
        search_term = "NOTACOUNTRY"
        VCR.use_cassette("recipe_search_#{search_term}", record: :all) do
  
          get "/api/v1/recipes?country=#{search_term}"
          recipes = JSON.parse(response.body, symbolize_names: true)
            expect(response).to_not be_successful
            expect(recipes[:error][:error_message]).to eq("No Country Found")
            expect(recipes[:error][:status]).to eq("Country Incorrect")
            expect(recipes[:error][:code]).to eq(400)

        end
      end
    end
  end
end