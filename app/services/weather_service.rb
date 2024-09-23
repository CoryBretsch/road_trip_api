class WeatherService 
  def self.search(lat_lng)
    conn = Faraday.new( url: "http://api.weatherapi.com" )
    response = conn.get( "/v1/forecast.json" ) do |req|
      req.params[:key] = Rails.application.credentials.weather[:key]
      req.params[:q] = lat_lng
      req.params[:days] = 5
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end