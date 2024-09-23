class BookReturn 
  attr_reader :id,
              :type,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(destination, forecast, total_books_found, books)
    @id = "null"
    @type = "books"
    @destination = destination
    @forecast = forecast 
    @total_books_found = total_books_found
    @books = books
  end
end