
require 'rails_helper'

describe PlacesService do
  describe "test connection" do
    it 'returns an array of all countries' do
      VCR.use_cassette("places_service_test") do
        test_connection = PlacesService.new.test_connection
        expect(test_connection).to be_a Hash
        expect(test_connection[:features]).to be_an Array
        expect(test_connection[:features][0][:properties][:name]).to eq("Farinella")
      end
    end
  end

  describe "tourist_sights" do
    it 'returns a country by search term' do
      VCR.use_cassette("tourist_sites") do
        sites = PlacesService.new.tourist_sights(2.33, 48.87)
        expect(sites).to be_an Array
        expect(sites[0][:type]).to eq("Feature")
        expect(sites[0][:properties]).to be_a Hash
        expect(sites[0][:properties][:name]).to eq("Palais du Louvre")
        expect(sites[0][:properties][:formatted]).to eq("Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France")
        expect(sites[0][:properties][:place_id]).to eq("513025c70ed2af024059358e28f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")
        expect(sites[0][:properties].count).to eq(21)
      end
    end
  end
end