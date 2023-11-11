class RecipeSerializer
  include JSONAPI::Serializer

  attributes :title
  attributes :url
  attributes :country
  attributes :image_url
end