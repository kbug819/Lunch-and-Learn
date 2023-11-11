
require 'rails_helper'

describe Country do
  it 'exists' do
    attributes = {
      "name": {
          "common": "Turks and Caicos Islands",
          "official": "Turks and Caicos Islands",
          "nativeName": {
              "eng": {
                  "official": "Turks and Caicos Islands",
                  "common": "Turks and Caicos Islands"
              }
          }
      }
    }
    country = Country.new(attributes)

    expect(country).to be_a Country
    expect(country.name).to eq("Turks and Caicos Islands")
  end
end