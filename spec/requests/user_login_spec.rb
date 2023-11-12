require 'rails_helper'

describe "user_login API" do
  describe "post sends information to create a user" do
    it "returns a list of recipes associated with a searched country" do
      new_user = {
        name: "Odell",
        email: "goodboy@ruffrruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(new_user)


      created_user = User.last
      expect(response).to have_http_status(201)
      expect(response).to have_http_status(201)
      expect(response).to be_successful
      expect(created_user.name).to eq(new_user[:name])
      expect(created_user.email).to eq(new_user[:email])
      expect(created_user.api_key).to be_present
    end