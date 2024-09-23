require 'rails_helper'

RSpec.describe 'Book Weather Facade' do 
  it "should call facade and return specific weather data in specific format" do 
    q = "Denver, CO"
    lat_lng = LatLngFacade.lat_lng(q)
    weather = BookWeatherFacade.current_weather(lat_lng)
    
    expect(weather).to be_a Hash
    expect(weather.keys.count).to be 2
    expect(weather).to have_key(:summary)
    expect(weather).to have_key(:temperature)
  end
end