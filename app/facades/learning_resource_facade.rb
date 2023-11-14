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
      {}
    else
      Video.new(video)
    end
  end

  def by_country(country)
    is_country = CountryFacade.new.country_search(country)
    if is_country == true
      LearningResource.new(country, video_search(country), image_search(country))
    else
      "No Country Found"
    end
  end
end