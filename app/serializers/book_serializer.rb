class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :genre, :pages, :year_of_publishing
end
