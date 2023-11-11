
require 'rails_helper'

describe PlacesService do
  it 'returns an array of all countries' do
    VCR.use_cassette("places_service_test") do
      test_connection = PlacesService.new.test_connection
      expect(test_connection).to be_a Hash
      expect(test_connection[:features]).to be_an Array
      expect(test_connection[:features][0][:properties][:name]).to eq("Farinella")

    end
  end
end