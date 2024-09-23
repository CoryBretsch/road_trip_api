require 'rails_helper'

RSpec.describe Current do 
  it "creates a current poro" do 
    attr = {
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

    current = Current.new(attr)

    expect(current).to be_a Current

    expect(current.last_updated).to eq("2024-09-21 13:30")
    expect(current.temperature).to eq(88.0)
    expect(current.feels_like).to eq(95.7)
    expect(current.humidity).to eq(52)
    expect(current.uvi).to eq(6.0)
    expect(current.visibility).to eq(9.0)
    expect(current.condition).to eq("Sunny")
    expect(current.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/113.png")
  end
end