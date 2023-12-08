class ReviewSerializer
  include JSONAPI::Serializer
  attributes :text

  attribute :book do |object|
    object.book.name
  end

  attribute :profile do |object|
    object.profile.full_name
  end
end
