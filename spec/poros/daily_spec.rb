require 'rails_helper'

RSpec.describe Daily do 
  it "creates ah daily poro" do 
    attr = {
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

    day = Daily.new(attr)

    expect(day).to be_a Daily

    expect(day.date).to eq("2024-09-21")
    expect(day.sunrise).to eq("07:25 AM")
    expect(day.sunset).to eq("07:36 PM")
    expect(day.max_temp).to eq(94.1)
    expect(day.min_temp).to eq(71.1)
    expect(day.condition).to eq("Patchy rain nearby")
    expect(day.icon).to eq("//cdn.weatherapi.com/weather/64x64/day/176.png")
  end
end