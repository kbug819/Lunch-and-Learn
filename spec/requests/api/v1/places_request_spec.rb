require 'rails_helper'

describe "places API" do
  describe "search for tourist sites based on given country" do
    it "happy_path - returns a list of tourist sites from a given country" do
      search_term = "France"
      VCR.use_cassette("tourist_sites") do

        get "/api/v1/tourist_sites?country=#{search_term}"
        expect(response).to be_successful

        sites = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(sites[:data]).to be_an Array
        expect(sites[:data].count).to eq(20)
        expect(sites[:data][0]).to be_a Hash
        expect(sites[:data][0]).to eq({
          "id": nil,
          "type": "tourist_site",
          "attributes": {
              "name": "Palais du Louvre",
              "address": "Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France",
              "place_id": "513025c70ed2af024059358e28f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265"
          }
        })
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

    it "happy_path - returns a list of tourist sites from a given country" do
      search_term = "Latvia"
      VCR.use_cassette("tourist_sites_#{search_term}") do

        get "/api/v1/tourist_sites?country=#{search_term}"
        expect(response).to be_successful

        sites = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(sites[:data]).to be_an Array
        expect(sites[:data][0]).to be_a Hash
        expect(sites[:data].count).to eq(20)
        expect(sites[:data][0][:attributes][:address]).to eq("Three Brothers, Mazā Pils iela, Riga, LV-1050, Latvia")
        expect(sites[:data][0][:id]).to eq(nil)
        expect(sites[:data][0][:attributes][:name]).to eq("Trīs brāļi")
        expect(sites[:data][0][:attributes][:place_id]).to eq("51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69")
      end
    end

    it "sad_path - returns an empty data array for sad path" do
      search_term = "Antarctica"
      VCR.use_cassette("tourist_sites_#{search_term}") do

        get "/api/v1/tourist_sites?country=#{search_term}"
        expect(response).to be_successful

        sites = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(sites[:data]).to eq([])
      end
    end
  end
end