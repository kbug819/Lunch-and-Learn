class LearningResourceSerializer
  include JSONAPI::Serializer

  attributes :country
  attributes :video
  attributes :images
end