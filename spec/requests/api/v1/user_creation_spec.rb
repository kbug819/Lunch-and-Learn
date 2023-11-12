require 'rails_helper'

describe "user API" do
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

    it "returns an error messsage if credentials aren't good" do
      other_user = User.create!(name: "georgge", email: "goodboy@ruffruff.com", password: "1234")
      new_user = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(new_user)
      error = JSON.parse(response.body, symbolize_names: true)[:errors][0]


      expect(response).to have_http_status(422)
      expect(error).to eq("Email has already been taken")


      new_user = {
        name: "Odell",
        email: "goodboy3@ruffrruff.com",
        password: "treats4lyf",
        password_confirmation: "NOMATCH"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(new_user)
      error = JSON.parse(response.body, symbolize_names: true)[:errors][0]


      expect(response).to have_http_status(422)
      expect(error).to eq("Password confirmation doesn't match Password")
    end
  end
end