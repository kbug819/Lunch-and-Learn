class LearningResourceFacade
  def initialize()
    @unsplash_service = UnsplashService.new
    @google_api = GoogleApiService.new
  end

  def image_search(search_term)
    @unsplash_service.image_search(search_term).map do |picture|
      Picture.new(picture)
    end
  end

  def video_search(search_term)
    video = @google_api.video_search(search_term).first
    if video == nil
      
    else
      Video.new(video)
    end
  end

  def by_country(country)
    LearningResource.new(country, video_search(country), image_search(country))
  end
end