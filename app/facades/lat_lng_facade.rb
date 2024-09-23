class LatLngFacade 
  def self.lat_lng(location)
    lat_lng_hash = MapQuestService.search(location)
    "#{lat_lng_hash[:lat]},#{lat_lng_hash[:lng]}"
  end
end