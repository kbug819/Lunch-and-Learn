class TouristSiteSerializer
  include JSONAPI::Serializer

  attributes :name
  attributes :address
  attributes :place_id
end