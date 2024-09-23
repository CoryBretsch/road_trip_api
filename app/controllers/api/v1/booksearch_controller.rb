class Api::V1::BooksearchController < ApplicationController 
  
  def index
    q = params[:location]
    quantity = params[:quantity].to_i

    lat_lng = LatLngFacade.lat_lng(q)
    weather = BookWeatherFacade.current_weather(lat_lng)
    book_return = BookFacade.book(quantity, q, weather)
    
    render json: BookSerializer.new(book_return)
  end
end