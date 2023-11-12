class Picture
  attr_reader :alt_tag, :url
  def initialize(picture_info)
    @alt_tag = picture_info[:alt_description]
    @url = picture_info[:urls][:raw]
  end
end