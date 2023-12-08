class ListSerializer
  include JSONAPI::Serializer
  attributes :name

  attribute :profile do |object|
    object.profile.full_name
  end
end
