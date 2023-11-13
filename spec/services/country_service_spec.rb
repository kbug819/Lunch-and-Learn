
require 'rails_helper'

describe CountryService do
  it 'returns an array of all countries' do
    VCR.use_cassette('country_list') do
    country_list = CountryService.new.get_all

      expect(country_list).to be_an Array
      expect(country_list[0][:name]).to be_a Hash
      expect(country_list[0][:name][:official]).to be_a String
      expect(country_list[0][:name][:official]).to eq("Turks and Caicos Islands")

      expect(country_list.last[:name]).to be_a Hash
      expect(country_list.last[:name][:official]).to be_a String
      expect(country_list.last[:name][:official]).to eq("Republic of Nicaragua")
    end
  end

  it 'returns a specific country based on a search' do
    search_term = "France"
    VCR.use_cassette("country_#{search_term}") do
      country = CountryService.new.by_search(search_term)
      expect(country).to be_a Hash
      expect(country[:name]).to be_a Hash
      expect(country[:name][:official]).to be_a String
      expect(country[:name][:official]).to eq("French Republic")
      expect(country[:capital][0]).to eq("Paris")
      expect(country[:capitalInfo]).to be_a Hash
      expect(country[:capitalInfo][:latlng]).to eq([48.87, 2.33])
    end
  end
end