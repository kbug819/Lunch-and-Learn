
require 'rails_helper'
describe CountryFacade do
  it '#all - provides an array of all countries and creates an Array' do

    VCR.use_cassette('country_list') do
      country_list = CountryFacade.new.all
      expect(country_list).to be_an Array
      expect(country_list.count).to eq(250)
      expect(country_list[0]).to be_a Country
    end
  end

  it '#random_country - provides an array of all countries and creates an Array' do
    VCR.use_cassette('country_list') do
      random_country = CountryFacade.new.random_country
      expect(random_country).to be_an Object
      expect(random_country).to be_a Country
      expect(random_country.name).to be_a String
    end
  end
end

