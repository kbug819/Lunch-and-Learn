class Country
  attr_reader :name, :capital, :capital_info
  def initialize(country_data)
    @name = country_data[:name][:official]
    @capital = country_data[:capital]
    @capital_info = country_data[:capitalInfo][:latlng]
  end
end