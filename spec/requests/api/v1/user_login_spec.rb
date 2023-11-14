require 'rails_helper'

describe "user_login API" do
  describe "post sends information to create a user" do
    it "returns a list of recipes associated with a searched country" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: SecureRandom.urlsafe_base64 )
      user_login = {
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_login)


      login_info = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(login_info[:data][:id]).to eq(user1.id.to_s)
      expect(login_info[:data][:type]).to eq("user")
      expect(login_info[:data][:attributes][:name]).to eq(user1.name)
      expect(login_info[:data][:attributes][:email]).to eq(user1.email)
      expect(login_info[:data][:attributes][:api_key]).to eq(user1.api_key)
    end

    it "returns an error message for bad credentials" do
      user1 = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: SecureRandom.urlsafe_base64 )
      user_login = {
        email: "goodboy@ruffruff.com",
        password: "NOMATCH",
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_login)


      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(response).to_not be_successful
      expect(error[:error][:error_message]).to eq("Bad credentials, please try again")


      user_login = {
        email: "goodboy4646546@ruffruff.com",
        password: "NOMATCH",
      }
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/sessions", headers: headers, params: JSON.generate(user_login)


      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(response).to_not be_successful
      expect(error[:error][:error_message]).to eq("Bad credentials, please try again")
    end
  end
end