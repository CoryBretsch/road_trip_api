class Api::V1::ForecastController < ApplicationController

  def index
    location = params[:location]
    lat_lng = LatLngFacade.lat_lng(location)
    forecast = ForecastFacade.forecast(lat_lng)
    render json: ForecastSerializer.new(forecast)
  end
end