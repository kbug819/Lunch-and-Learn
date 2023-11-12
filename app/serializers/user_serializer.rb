class UserSerializer
  include JSONAPI::Serializer

  attributes :name
  attributes :email
  attributes :api_key
end