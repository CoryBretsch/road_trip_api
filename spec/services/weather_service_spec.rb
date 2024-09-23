require 'rails_helper'

RSpec.describe 'Weather Service' do 
  it "hits API for forecast with coordinates" do 
    lat_lng = "39.10713,-84.50413"
    forecast = WeatherService.search(lat_lng)

    expect(forecast).to be_a Hash
    expect(forecast.keys.count).to eq 3

    expect(forecast).to have_key(:location)
    expect(forecast[:location]).to be_a Hash
    expect(forecast[:location][:name]).to eq("Newport")
        
    expect(forecast).to have_key(:current)
    expect(forecast[:current]).to be_a Hash

    expect(forecast).to have_key(:forecast)
    expect(forecast[:forecast]).to be_a Hash
    expect(forecast[:forecast].keys.count).to be 1
    expect(forecast[:forecast]).to have_key(:forecastday)

    expect(forecast[:forecast]).to have_key(:forecastday)
    expect(forecast[:forecast][:forecastday]).to be_an Array
  end
end