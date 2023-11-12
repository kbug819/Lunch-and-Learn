require 'rails_helper'

describe "get_all_favorites API" do
  describe "finds user by api_key" do
    it "returns all users favorite recipes" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      favorite1 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_1", recipe_title: "recipe_title_1")
      favorite2 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_2")
      favorite3 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_3")

      get "/api/v1/favorites?api_key=#{user1.api_key}"


      favorites = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(favorites[:data][0][:id]).to eq("#{favorite1.id}")
      expect(favorites[:data][0][:type]).to eq("favorite")
      expect(favorites[:data][0][:attributes][:recipe_title]).to eq("#{favorite1.recipe_title}")
      expect(favorites[:data][0][:attributes][:recipe_link]).to eq("#{favorite1.recipe_link}")
      expect(favorites[:data][0][:attributes][:country]).to eq("#{favorite1.country}")
      # expect(favorites[:data][0][:attributes][:created_at]).to eq("#{favorite1.created_at.iso8601}")
      expect(favorites[:data][1][:attributes][:recipe_title]).to eq("#{favorite2.recipe_title}")
      expect(favorites[:data][1][:attributes][:recipe_link]).to eq("#{favorite2.recipe_link}")
      expect(favorites[:data][1][:attributes][:country]).to eq("#{favorite2.country}")
      # expect(favorites[:data][1][:attributes][:created_at]).to eq("#{favorite2.created_at}")
      expect(favorites[:data][2][:attributes][:recipe_title]).to eq("#{favorite3.recipe_title}")
      expect(favorites[:data][2][:attributes][:recipe_link]).to eq("#{favorite3.recipe_link}")
      expect(favorites[:data][2][:attributes][:country]).to eq("#{favorite3.country}")
      # expect(favorites[:data][2][:attributes][:created_at]).to eq("#{favorite3.created_at}")

    end

    it "returns an error message for bad credentials" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      favorite1 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_1", recipe_title: "recipe_title_1")
      favorite2 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_2")
      favorite3 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_3")
      
      get "/api/v1/favorites?api_key=NOMATCH"

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(response).to_not be_successful
      expect(error[:error][:error_message]).to eq("Bad credentials, please try again")
      expect(error[:error][:status]).to eq("Bad Credentials")
      expect(error[:error][:code]).to eq(404)
    end

    it "will return empty data if user has no favorites" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      
      get "/api/v1/favorites?api_key=#{user1.api_key}"

      result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(result[:data]).to eq([])

    end
  end
end