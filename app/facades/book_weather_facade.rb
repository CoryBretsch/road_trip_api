class BookWeatherFacade 
  def self.current_weather(lat_lng)
    weather_data = WeatherService.search(lat_lng)
    {"summary": "#{weather_data[:current][:condition][:text]}", "temperature": "#{weather_data[:current][:temp_f]}"}
  end
end