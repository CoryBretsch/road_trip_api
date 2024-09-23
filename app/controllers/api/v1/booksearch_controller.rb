class Api::V1::BooksearchController < ApplicationController 
  
  def index
    q = params[:location]
    quantity = params[:quantity].to_i

    lat_lng = LatLngFacade.lat_lng(q)
    weather_data = WeatherService.search(lat_lng)

    destination = "#{weather_data[:location][:name]}, #{weather_data[:location][:region]}"
    forecast = {"summary": "#{weather_data[:current][:condition][:text]}",
                "temperature": "#{weather_data[:current][:temp_f]}"}
                  
    conn = Faraday.new( url: "https://openlibrary.org" )
    response = conn.get( "/search.json" ) do |req|
      req.params[:q] = q 
    end
    all_books = JSON.parse(response.body, symbolize_names: true)
    total_books_found = all_books[:numFound]
    book_data = all_books[:docs].first(quantity)

    books = book_data.map do |book|
      Book.new(book)
    end

    book_return = BookReturn.new(destination, forecast, total_books_found, books)
    render json: BookSerializer.new(book_return)
  end
end