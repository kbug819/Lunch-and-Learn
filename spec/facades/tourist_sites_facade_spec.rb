
require 'rails_helper'
describe TouristSitesFacade do
  it '#tourist_sites - returns an array of tourist site objects' do
    VCR.use_cassette('tourist_sites') do
      sites = TouristSitesFacade.new.tourist_sites("France")
      expect(sites).to be_an Array
      expect(sites.count).to eq(20)
      expect(sites[0]).to be_a TouristSite
      expect(sites[0].address).to eq("Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France")
      expect(sites[0].id).to eq(nil)
      expect(sites[0].name).to eq("Palais du Louvre")
      expect(sites[0].place_id).to eq("513025c70ed2af024059358e28f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")
    end
  end

  it '#tourist_sites - happy_path#2 returns an array of tourist site objects' do
    search_term = "Latvia"
    VCR.use_cassette("tourist_sites_#{search_term}") do
      sites = TouristSitesFacade.new.tourist_sites("#{search_term}")
      expect(sites).to be_an Array
      expect(sites.count).to eq(20)
      expect(sites[0]).to be_a TouristSite
      expect(sites[0].address).to eq("Three Brothers, Mazā Pils iela, Riga, LV-1050, Latvia")
      expect(sites[0].id).to eq(nil)
      expect(sites[0].name).to eq("Trīs brāļi")
      expect(sites[0].place_id).to eq("51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69")
    end
  end

  it '#tourist_sites - sad path, returns an array of tourist site objects' do
    search_term = "Antarctica"
    VCR.use_cassette("tourist_sites_#{search_term}") do
      sites = TouristSitesFacade.new.tourist_sites("#{search_term}")
      expect(sites).to eq([])
    end
  end
end