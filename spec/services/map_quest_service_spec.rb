require 'rails_helper'

RSpec.describe 'Map Quest Service' do 
  it "hits API for lat lng coordinates", :vcr do 
    location = "cincinnati,oh"
    lat_lng_hash = MapQuestService.search(location)

    expect(lat_lng_hash).to be_a Hash
    expect(lat_lng_hash.keys.count).to eq 2
    expect(lat_lng_hash).to have_key(:lat)
    expect(lat_lng_hash[:lat]).to be_a Float
    expect(lat_lng_hash[:lat]).to eq(39.10713)
    
    expect(lat_lng_hash).to have_key(:lng)
    expect(lat_lng_hash[:lng]).to be_a Float
    expect(lat_lng_hash[:lng]).to eq(-84.50413)
  end
end