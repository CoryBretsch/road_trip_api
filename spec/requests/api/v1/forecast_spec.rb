require 'rails_helper'

describe "Road Trip Forecast API" do 
  describe "Happy Path" do
    it "send weather forecast for given location" do 
      location = "Cincinnati, OH"
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/forecast?location=#{location}", headers: headers

      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(forecast.keys.count).to be 3
      expect(forecast).to have_key(:id)
      expect(forecast[:id]).to eq("null")
      expect(forecast).to have_key(:type)
      expect(forecast[:type]).to eq("forecast")
      expect(forecast).to have_key(:attributes)
      expect(forecast[:attributes]).to be_a Hash
      attributes_keys = forecast[:attributes].keys.count
      expect(attributes_keys).to be 3

      expect(forecast[:attributes]).to have_key(:current_weather)
      expect(forecast[:attributes][:current_weather]).to be_a Hash
      expect(forecast[:attributes][:current_weather]).to have_key(:last_updated)
      expect(forecast[:attributes][:current_weather][:last_updated]).to be_a String
      expect(forecast[:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:attributes][:current_weather][:temperature]).to be_a Float
      expect(forecast[:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:attributes][:current_weather][:humidity]).to be_an Integer
      expect(forecast[:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:attributes][:current_weather][:uvi]).to be_a Float
      expect(forecast[:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:attributes][:current_weather][:visibility]).to be_a Float
      expect(forecast[:attributes][:current_weather]).to have_key(:condition)
      expect(forecast[:attributes][:current_weather][:condition]).to be_a String
      expect(forecast[:attributes][:current_weather]).to have_key(:icon)
      expect(forecast[:attributes][:current_weather][:icon]).to be_a String

      current_weather_keys = forecast[:attributes][:current_weather].keys.count
      expect(current_weather_keys).to be 8

      expect(forecast[:attributes]).to have_key(:daily_weather)
      expect(forecast[:attributes][:daily_weather]).to be_an Array
      expect(forecast[:attributes][:daily_weather].count).to eq 5

      forecast[:attributes][:daily_weather].each do |day|
        expect(day).to have_key(:date)
        expect(day[:date]).to be_a String
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).to be_a String
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).to be_a String
        expect(day).to have_key(:max_temp)
        expect(day[:max_temp]).to be_a Float
        expect(day).to have_key(:min_temp)
        expect(day[:min_temp]).to be_a Float
        expect(day).to have_key(:condition)
        expect(day[:condition]).to be_a String
        expect(day).to have_key(:icon)
        expect(day[:icon]).to be_a String

        daily_weather_keys = day.keys.count
        expect(daily_weather_keys).to be 7
      end
      
      expect(forecast[:attributes]).to have_key(:hourly_weather)
      expect(forecast[:attributes][:hourly_weather]).to be_an Array
      expect(forecast[:attributes][:hourly_weather].count).to eq 24

      forecast[:attributes][:hourly_weather].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour[:time]).to be_a String
        expect(hour).to have_key(:temperature)
        expect(hour[:temperature]).to be_a Float
        expect(hour).to have_key(:conditions)
        expect(hour[:time]).to be_a String
        expect(hour).to have_key(:icon)
        expect(hour[:icon]).to be_a String

        hourly_weather_keys = hour.keys.count
        expect(hourly_weather_keys).to be 4
      end
      
      
    end
  end
end