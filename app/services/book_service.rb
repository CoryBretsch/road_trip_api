class BookService
  def self.book_search(q)
    conn = Faraday.new( url: "https://openlibrary.org" )
    response = conn.get( "/search.json" ) do |req|
      req.params[:q] = q 
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end