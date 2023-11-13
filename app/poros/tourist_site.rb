class TouristSite
  attr_reader :id, :name, :address, :place_id
  def initialize(site_data)
    @id = nil
    @name = site_data[:properties][:name]
    @address = site_data[:properties][:formatted]
    @place_id = site_data[:properties][:place_id]
  end
end