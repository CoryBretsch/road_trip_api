require 'rails_helper'

RSpec.describe Hourly do 
  it "creates ah hourly poro" do 
    attr = {
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

    hour = Hourly.new(attr)

    expect(hour).to be_an Hourly

    expect(hour.time).to eq("00:00")
    expect(hour.temperature).to eq(78.6)
    expect(hour.conditions).to eq("Overcast ")
    expect(hour.icon).to eq("//cdn.weatherapi.com/weather/64x64/night/122.png")
  end
end