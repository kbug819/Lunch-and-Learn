require 'rails_helper'

describe "delete_favorite" do
  describe "finds user by api_key" do
    it "verifies favorite and user id are the same, then deletes" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      favorite1 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_1", recipe_title: "recipe_title_1")
      favorite2 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_2")
      favorite3 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_3")

      headers = {"CONTENT_TYPE" => "application/json"}
      delete "/api/v1/favorites/#{favorite1.id}?api_key=#{user1.api_key}"

      success = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(success[:success]).to eq("Favorite deleted")
      expect(user1.favorites).to eq([favorite2, favorite3])
    end

    it "returns an error with incorrect api key" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "lakjsdfflkj923802")
      favorite1 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_1", recipe_title: "recipe_title_1")
      favorite2 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_2")
      favorite3 = user1.favorites.create!(country: "thailand", recipe_link: "recipe_link_2", recipe_title: "recipe_title_3")

      headers = {"CONTENT_TYPE" => "application/json"}
      delete "/api/v1/favorites/#{favorite1.id}?api_key=NOMATCH"
      error = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(error[:error][:error_message]).to eq("Bad credentials, please try again")
      expect(user1.favorites).to eq([favorite1, favorite2, favorite3])

    end
  end
end