class BookFacade 
  def self.book(quantity, q, weather)
    all_books = BookService.book_search(q)
    total_books_found = all_books[:numFound]
    book_data = all_books[:docs].first(quantity)
    books = book_data.map do |book|
      Book.new(book)
    end
    BookReturn.new(q, weather, total_books_found, books)
  end
end