require 'rails_helper'

describe "get_all_favorites API" do
  describe "finds user by api_key" do
    it "returns all users favorite recipes" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_1", recipe_title: "recipe_title_1")
      user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_2")
      user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_3")

      get "/api/v1/favorites?api_key=#{user1.api_key}"


      success = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(success[:success]).to eq("Favorite added successfully")

    end

    xit "returns an error message for bad credentials" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: SecureRandom.urlsafe_base64 )
      add_favorite = {
        api_key: "NOMATCH",
        country: "thailand",
        recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(add_favorite)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(response).to_not be_successful
      expect(error[:error][:error_message]).to eq("Bad credentials, please try again")
      expect(error[:error][:status]).to eq("Bad Credentials")
      expect(error[:error][:code]).to eq(404)

    end
  end
end