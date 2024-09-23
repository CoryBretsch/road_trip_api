class Daily
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :condition,
              :icon
              
  def initialize(forecast)
    @date = forecast[:date]
    @sunrise = forecast[:astro][:sunrise]
    @sunset = forecast[:astro][:sunset]
    @max_temp = forecast[:day][:maxtemp_f]
    @min_temp = forecast[:day][:mintemp_f]
    @condition = forecast[:day][:condition][:text]
    @icon = forecast[:day][:condition][:icon]
  end
end