class BookSerializer 
  include JSONAPI::Serializer

  set_id :id 
  set_type :type
  attributes :destination, :forecast, :total_books_found, :books
end