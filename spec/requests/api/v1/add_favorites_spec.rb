require 'rails_helper'

describe "add_favorite API" do
  describe "finds user by api_key" do
    it "creates an entry on a one to many table for favorites" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      add_favorite = {
        api_key: "lakjsdfflkj923802",
        country: "thailand",
        recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
        recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/favorites", headers: headers, params: JSON.generate(add_favorite)


      success = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(success).to eq({success: "Favorite added successfully"})
      expect(success[:success]).to eq("Favorite added successfully")

    end

    it "returns an error message for bad credentials" do
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

      expect(response).to have_http_status(400)
      expect(response).to_not be_successful
      expect(error[:error]).to be_a Hash
      expect(error[:error][:error_message]).to eq("Bad credentials, please try again")
    end
  end
end