require 'rails_helper'

RSpec.describe 'Book Facade' do 
  it "should call facade and return data in structure that is ready to be serialized" do 
    q = "Denver, CO"
    quantity = 5
    lat_lng = LatLngFacade.lat_lng(q)
    weather = BookWeatherFacade.current_weather(lat_lng)
    book_return = BookFacade.book(quantity, q, weather)
  
    expect(book_return).to be_a BookReturn
  end
end