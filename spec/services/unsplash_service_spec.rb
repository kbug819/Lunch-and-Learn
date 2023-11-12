
require 'rails_helper'

describe UnsplashService do
  it "returns 10 images related to search" do
    search_term = "Thailand"
    VCR.use_cassette("unsplash_images_#{search_term}") do
      images = UnsplashService.new.image_search(search_term)
      expect(images).to be_an Array
      expect(images[0][:alt_description]).to eq("standing statue and temples landmark during daytime")
      expect(images[0][:urls][:raw]).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHxUaGFpbGFuZHxlbnwwfHx8fDE2OTk3NDc1MTB8MA&ixlib=rb-4.0.3")
      expect(images.count).to eq(10)
    end
  end
end