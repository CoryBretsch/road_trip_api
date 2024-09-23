class ForecastFacade 
  def self.forecast(lat_lng)
    forecast_response = WeatherService.search(lat_lng)
    current = Current.new(forecast_response[:current])
    daily = forecast_response[:forecast][:forecastday].map do |day|
      Daily.new(day)
    end
    hourly = forecast_response[:forecast][:forecastday][0][:hour].map do |hour|
      Hourly.new(hour)
    end
    Forecast.new(current, daily, hourly)
  end
end