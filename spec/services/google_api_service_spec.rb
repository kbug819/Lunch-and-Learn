
require 'rails_helper'

describe GoogleApiService do
  it "returns 1 video's information per search term" do
    search_term = "Thailand"
    VCR.use_cassette("youtube_video_#{search_term}") do
      youtube_video = GoogleApiService.new.video_search(search_term)
      expect(youtube_video).to be_an Array
      expect(youtube_video[0][:snippet]).to be_a Hash
      expect(youtube_video[0][:snippet][:title]).to eq("A Super Quick History of Laos")
      expect(youtube_video[0][:id][:videoId]).to eq("uw8hjVqxMXw")
    end
  end
end