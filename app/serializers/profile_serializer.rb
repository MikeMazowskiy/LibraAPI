class ProfileSerializer
  include JSONAPI::Serializer
  attributes :nick_name, :full_name, :age, :author
end
