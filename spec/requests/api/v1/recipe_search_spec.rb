require 'rails_helper'

describe "recipes API" do
  describe "search for a recipe based on a country" do
    it "returns a list of recipes associated with a searched country" do
      search_term = "Thailand"
      VCR.use_cassette("recipe_search_#{search_term}") do

        get "/api/v1/recipes?country=#{search_term}"
        expect(response).to be_successful

        recipes = JSON.parse(response.body, symbolize_names: true)
        expect(recipes[:data][0]).to eq({:id=>nil,
          :type=>"recipe",
          :attributes=>
          {:title=>"Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
            :url=>"http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9",
            :country=>"Thailand",
            :image_url=>
            "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEL7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIGFKJs364SA53qmev%2Bg%2FjCC1o%2FDwIEY3NENyKBbwvyJUAiBzH2chyKGGJVwMmbfeLI3Xqquu8EDOi4GcWOg6O2ZdGCrCBQj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIMp%2BFcNoKvLh4sXxCiKpYFfCCjKrq7TvayvACPCkszyVWN9y77vyj7ZttjaFr1rZqMzTtsvAD%2BUnVX97gY62yMcSWMvD7HWNZMXPYM%2Bq53A1FJxjuFUBaZkB5rqjOCO4Jliz2zc7pVDdMRX%2FSmwIm8ZTbIdcliU7D5USYitN9oKa7OCkfQowHC%2BsylW9XH%2BAA%2BCugbfqKhE6TuFN4xAey9Lw1RBttp7BEa2GfUvoCZ8Uw0E%2B%2F6D0CN2fIQ%2BxecilV2SBPkTMHLGEZf3b1WqvbS18djPI4Tskjua%2F%2FQfvjDNQjmC6bnqELCBdl1i7nd5W%2BDUi5svBxvuLO%2F%2BY2NjuBbEBZ5fQbIZpgf2GftiQzdw3tH%2F3iQtEPWVhqmSUiN7qhlc0rvPAIXI5RJ8vh6Od8679T%2BVcq3vXoz7KrQFtBC3F0D0GvLaA%2BvxQ6qEAlXxubAolHPydntPJDRLrTjUR4SIHneYcDrJb0e8zZgQy2MfAn%2B1ZRE7OD5LXRzBn4ycAS83ZEWpTtHuMMYbUPnwYeS1mdlKaOFRJkGMRKpx5b7nKsI0cOa6f7niiW6SFKYhCD2YMBS%2FIxZ9ZpZM7CIXUDHXUlWDD0BsKqpm%2BKDUoLJwibM2TqU%2BYwO3vMqDp8WDMwD0uUcl8%2FNePXdbRzx6hZjSH0KFPnX2Lapy1sn5JdfPSKpAGTaTV7kts3ZmffWT5Cf8RkX6Kc6D2qM4cZmqE9AXYzlx%2BEM%2BCv1%2BFlqBXKNEEUDvrwtzGvOSut%2FFnE4mSh0lqkmeISM9%2FJ2X1guMogfgZr3GuIe4fSkxtMH%2Bov6ILyOo7LYYF4SH3%2Fg7ezAAM9Tak9RXkxnjvbWlztaZ3dYLX53aZOjMIhbtoD38J9YGPdxG66b9xEE9SDH55NRbXzCP%2FfKEEUwo8W6qgY6sgHXK6ytglqzTGRnld2lsVOR4TELlu0iGsVju2u3XIVQOV0L132kmW9azXembMe9PEoim8E%2B0Xr%2FDkRlShWB15qes2%2BtxHvKSu8STrLZ5HwRGYjShw%2B%2FAGjsG0xixT2H%2BBivNLnOaLkGtIT4eyhrDXGnFZeSuSk51Ioy3UWA%2FWZ0KB0WZFYqs1KbxcaYCgN%2B7Jz9cLTtwy3R5LwAFMxKw%2Bam1LpH2CtQKP7o0vvfDuv7M0J0&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231110T222150Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFHZP5QIF6%2F20231110%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5767b9aa8da805b6f42b3495c698e945f8b7a3b7a5cae9ea575f3fb441e7a1f5"}
            })
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