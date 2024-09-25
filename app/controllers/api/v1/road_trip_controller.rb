class Api::V1::RoadTripController < ApplicationController 

  def create
    user = User.find_by(api_key: params[:api_key])
    start_city = params[:origin]
    end_city = params[:destination]
      if user
        conn = Faraday.new( url: "https://www.mapquestapi.com" )
        response = conn.get( "/directions/v2/route" ) do |req|
          req.params[:key] = Rails.application.credentials.map_quest[:key]
          req.params[:from] = start_city 
          req.params[:to] = end_city
        end
        travel_time = JSON.parse(response.body, symbolize_names: true)[:route][:realTime]
        formatted_time = JSON.parse(response.body, symbolize_names: true)[:route][:legs][0][:formattedTime]

        lat_lng = LatLngFacade.lat_lng(end_city)

        conn = Faraday.new( url: "http://api.weatherapi.com" )
        response = conn.get( "/v1/forecast.json" ) do |req|
          req.params[:key] = Rails.application.credentials.weather[:key]
          req.params[:q] = lat_lng
        end
        local_time = JSON.parse(response.body, symbolize_names: true)[:location][:localtime_epoch]
        forecast_time = local_time + travel_time

        conn = Faraday.new( url: "http://api.weatherapi.com" )
        response = conn.get( "/v1/forecast.json" ) do |req|
          req.params[:key] = Rails.application.credentials.weather[:key]
          req.params[:q] = lat_lng
          req.params[:unixdt] = forecast_time
        end

        date_epoch = JSON.parse(response.body, symbolize_names: true)[:forecast][:forecastday][0][:date_epoch]

        hour = (forecast_time - date_epoch)/60/60

        conn = Faraday.new( url: "http://api.weatherapi.com" )
        response = conn.get( "/v1/forecast.json" ) do |req|
          req.params[:key] = Rails.application.credentials.weather[:key]
          req.params[:q] = lat_lng
          req.params[:unixdt] = forecast_time
          req.params[:hour] = hour
        end

        datetime = JSON.parse(response.body, symbolize_names: true)[:forecast][:forecastday][0][:hour][0][:time]
        temperature = JSON.parse(response.body, symbolize_names: true)[:forecast][:forecastday][0][:hour][0][:temp_f]
        condition = JSON.parse(response.body, symbolize_names: true)[:forecast][:forecastday][0][:hour][0][:condition][:text]

        weather_at_eta = {
          "datetime": datetime,
          "temperature": temperature,
          "condition": condition
        }

        road_trip = RoadTrip.new(start_city, end_city, formatted_time, weather_at_eta)
        
        render json: RoadTripSerializer.new(road_trip), status: 200
        
      else
        render json: ErrorSerializer.new(ErrorMessage.new("Invalid Credentials", 400)).serialize_json, status: 400
      end
  end
end