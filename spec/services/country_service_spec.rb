
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
end