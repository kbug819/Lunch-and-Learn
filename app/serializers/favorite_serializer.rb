class FavoriteSerializer
  include JSONAPI::Serializer

  attributes :recipe_title
  attributes :recipe_link
  attributes :country
  attributes :created_at
end