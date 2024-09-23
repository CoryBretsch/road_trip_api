class MapQuestService 
  def self.search(location)
    conn = Faraday.new( url: "https://www.mapquestapi.com" )
    response = conn.get( "/geocoding/v1/address" ) do |req|
      req.params[:key] = Rails.application.credentials.map_quest[:key]
      req.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end
end