require 'rails_helper'

RSpec.describe Forecast do 
  it "creates a forecast poro" do 
    current_attr = {
      "last_updated_epoch": 1726939800,
      "last_updated": "2024-09-21 13:30",
      "temp_c": 31.1,
      "temp_f": 88.0,
      "is_day": 1,
      "condition": {
          "text": "Sunny",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
          "code": 1000
      },
      "wind_mph": 2.5,
      "wind_kph": 4.0,
      "wind_degree": 288,
      "wind_dir": "WNW",
      "pressure_mb": 1014.0,
      "pressure_in": 29.93,
      "precip_mm": 0.0,
      "precip_in": 0.0,
      "humidity": 52,
      "cloud": 0,
      "feelslike_c": 35.4,
      "feelslike_f": 95.7,
      "windchill_c": 29.8,
      "windchill_f": 85.6,
      "heatindex_c": 32.8,
      "heatindex_f": 91.1,
      "dewpoint_c": 21.1,
      "dewpoint_f": 69.9,
      "vis_km": 16.0,
      "vis_miles": 9.0,
      "uv": 6.0,
      "gust_mph": 2.8,
      "gust_kph": 4.6
  }
    daily_attr = {
      "date": "2024-09-21",
      "date_epoch": 1726876800,
      "day": {
          "maxtemp_c": 34.5,
          "maxtemp_f": 94.1,
          "mintemp_c": 21.7,
          "mintemp_f": 71.1,
          "avgtemp_c": 27.2,
          "avgtemp_f": 81.0,
          "maxwind_mph": 4.3,
          "maxwind_kph": 6.8,
          "totalprecip_mm": 3.0,
          "totalprecip_in": 0.12,
          "totalsnow_cm": 0.0,
          "avgvis_km": 9.9,
          "avgvis_miles": 6.0,
          "avghumidity": 58,
          "daily_will_it_rain": 1,
          "daily_chance_of_rain": 78,
          "daily_will_it_snow": 0,
          "daily_chance_of_snow": 0,
          "condition": {
              "text": "Patchy rain nearby",
              "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
              "code": 1063
          },
          "uv": 6.0
      },
      "astro": {
          "sunrise": "07:25 AM",
          "sunset": "07:36 PM",
          "moonrise": "09:39 PM",
          "moonset": "11:46 AM",
          "moon_phase": "Waning Gibbous",
          "moon_illumination": 88,
          "is_moon_up": 0,
          "is_sun_up": 0
      }
    }
    hourly_attr = {
      "time_epoch": 1726891200,
      "time": "2024-09-21 00:00",
      "temp_c": 25.9,
      "temp_f": 78.6,
      "is_day": 0,
      "condition": {
          "text": "Overcast ",
          "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
          "code": 1009
      },
      "wind_mph": 2.7,
      "wind_kph": 4.3,
      "wind_degree": 255,
      "wind_dir": "WSW",
      "pressure_mb": 1011.0,
      "pressure_in": 29.87,
      "precip_mm": 0.0,
      "precip_in": 0.0,
      "snow_cm": 0.0,
      "humidity": 51,
      "cloud": 100,
      "feelslike_c": 26.6,
      "feelslike_f": 79.8,
      "windchill_c": 25.9,
      "windchill_f": 78.6,
      "heatindex_c": 26.6,
      "heatindex_f": 79.8,
      "dewpoint_c": 14.6,
      "dewpoint_f": 58.3,
      "will_it_rain": 0,
      "chance_of_rain": 0,
      "will_it_snow": 0,
      "chance_of_snow": 0,
      "vis_km": 10.0,
      "vis_miles": 6.0,
      "gust_mph": 5.6,
      "gust_kph": 9.1,
      "uv": 0
  }

    hourly = Hourly.new(hourly_attr)
    daily = Daily.new(daily_attr)
    current = Current.new(current_attr)

    forecast = Forecast.new(current, daily, hourly)

    expect(forecast).to be_a Forecast
    expect(forecast.id).to eq("null")
    expect(forecast.type).to eq("forecast")
    expect(forecast.current_weather).to be_a Current
    expect(forecast.daily_weather).to be_a Daily
    expect(forecast.hourly_weather).to be_a Hourly
  end
end