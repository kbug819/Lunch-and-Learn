
require 'rails_helper'
describe LearningResourceFacade do
  it '#image_search - returns an image based on a search_term' do
    search_term = "Thailand"  
    VCR.use_cassette("learning_resources1_#{search_term}") do
      image = LearningResourceFacade.new.image_search(search_term)
      expect(image).to be_an Array
      expect(image[0]).to be_a Picture
      expect(image[0].alt_tag).to eq("standing statue and temples landmark during daytime")
      expect(image[0].url).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w1MDU1OTR8MHwxfHNlYXJjaHwxfHxUaGFpbGFuZHxlbnwwfHx8fDE2OTk5MDkxMTd8MA&ixlib=rb-4.0.3")
    end
  end
  
  it '#video_search - returns a video based on a search_term' do
    search_term = "Thailand"  
    VCR.use_cassette("learning_resources2_#{search_term}") do
      video = LearningResourceFacade.new.video_search(search_term)
      expect(video).to be_a Video
      expect(video.title).to eq("A Super Quick History of Laos")
      expect(video.youtube_video_id).to eq("uw8hjVqxMXw")
    end
  end

  it '#by_country - returns a LearningResource object with video and image' do
    search_term = "Thailand"  
    VCR.use_cassette("learning_resources3_#{search_term}") do
      resource = LearningResourceFacade.new.by_country(search_term)
      expect(resource).to be_a LearningResource
      expect(resource.country).to eq("Thailand")
      expect(resource.id).to eq(nil)
      expect(resource.images).to be_an Array
      expect(resource.images[0]).to be_a Picture
      expect(resource.video).to be_a Video
    end
  end
end