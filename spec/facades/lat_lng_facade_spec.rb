require 'rails_helper'

RSpec.describe 'LatLngFacade' do 
  it "should call facade and return lat lng coordinates" do 
    location = "cincinnati,oh"
    lat_lng = LatLngFacade.lat_lng(location)
  
    expect(lat_lng).to be_a String
    expect(lat_lng).to eq("39.10713,-84.50413")
  end
end