class Forecast
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(current, daily, hourly)
    @id = "null"
    @type = "forecast"
    @current_weather = current
    @daily_weather = daily
    @hourly_weather = hourly
  end
end