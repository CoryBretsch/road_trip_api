require 'rails_helper'

RSpec.describe 'ForecastFacade' do 
  it 'shoudl call facade and return forecast' do 
    lat_lng = "39.10713,-84.50413"
    forecast = ForecastFacade.forecast(lat_lng)

    expect(forecast).to be_a Forecast
  end
end