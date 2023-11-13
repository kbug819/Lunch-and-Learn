require 'rails_helper'

describe "places API" do
  describe "search for tourist sites based on given country" do
    it "returns a list of tourist sites from a given country" do
      search_term = "France"
      VCR.use_cassette("tourist_sites") do

        get "/api/v1/tourist_sites?country=#{search_term}"
        expect(response).to be_successful

        sites = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(sites[:data]).to be_an Array
        expect(sites[:data].count).to eq(20)
        expect(sites[:data][0]).to be_a Hash
        expect(sites[:data][0][:id]).to eq(nil)
        expect(sites[:data][0][:type]).to eq("tourist_site")
        expect(sites[:data][0][:attributes][:name]).to eq("Palais du Louvre")
        expect(sites[:data][0][:attributes][:address]).to eq("Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France")
        expect(sites[:data][0][:attributes][:place_id]).to eq("513025c70ed2af024059358e28f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")

        expect(sites[:data][19][:type]).to eq("tourist_site")
        expect(sites[:data][19][:attributes][:name]).to eq("Statue équestre de Jeanne D'Arc")
        expect(sites[:data][19][:attributes][:address]).to eq("Statue équestre de Jeanne D'Arc, Place Saint-Augustin, 75008 Paris, France")
        expect(sites[:data][19][:attributes][:place_id]).to eq("51c52120d5398e0240599b1b2d8e0e704840f00102f901a7fd05040000000092032053746174756520c3a971756573747265206465204a65616e6e65204427417263")
      end
    end
  end
end