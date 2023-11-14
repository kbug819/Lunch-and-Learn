require 'rails_helper'

describe "learning resources endpoint" do
  describe "search information for a specific country" do
    it "returns a video and a list of pictures" do
      search_term = "thailand"
      VCR.use_cassette("learning_resources_#{search_term}") do

        get "/api/v1/learning_resources?country=#{search_term}"
        expect(response).to be_successful

        learning = JSON.parse(response.body, symbolize_names: true)
 
        expect(learning[:data]).to be_an Hash
        expect(learning[:data][:id]).to eq(nil)
        expect(learning[:data][:type]).to eq("learning_resource")
        expect(learning[:data][:attributes][:country]).to eq("#{search_term}")
        expect(learning[:data][:attributes][:video]).to be_a Hash
        expect(learning[:data][:attributes][:video][:title]).to eq("A Super Quick History of Laos")
        expect(learning[:data][:attributes][:video][:youtube_video_id]).to eq("uw8hjVqxMXw")
        expect(learning[:data][:attributes][:images]).to be_an Array
        expect(learning[:data][:attributes][:images].count).to eq 10
        expect(learning[:data][:attributes][:images][0]).to be_an Hash
        expect(learning[:data][:attributes][:images][0][:alt_tag]).to eq("standing statue and temples landmark during daytime")
        expect(learning[:data][:attributes][:images][0][:url]).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2OTk5ODQwOTh8MA&ixlib=rb-4.0.3")
      end
    end

    it "returns an error if search term is not a country" do
      search_term = "nomatch"
      VCR.use_cassette("learning_resources_#{search_term}") do

        get "/api/v1/learning_resources?country=#{search_term}"
        expect(response).to_not be_successful

        learning = JSON.parse(response.body, symbolize_names: true)
 
        expect(learning[:error][:error_message]).to eq("No Country Found")
        expect(learning[:error][:status]).to eq("Country Incorrect")
        expect(learning[:error][:code]).to eq(400)
      end
    end

    it "returns an empty array or empty hash if no videos or images are returned" do
      search_term = "northern mariana islands"
      VCR.use_cassette("learning_resources_#{search_term}") do

        get "/api/v1/learning_resources?country=#{search_term}"
        expect(response).to be_successful

        learning = JSON.parse(response.body, symbolize_names: true)
        expect(learning[:data][:id]).to eq(nil)
        expect(learning[:data][:type]).to eq("learning_resource")
        expect(learning[:data][:attributes][:country]).to eq(search_term)
        expect(learning[:data][:attributes][:video]).to eq({})
        expect(learning[:data][:attributes][:images]).to be_an Array
      end
    end
  end
end