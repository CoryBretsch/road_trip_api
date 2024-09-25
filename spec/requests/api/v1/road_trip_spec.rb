require 'rails_helper'

RSpec.describe "Road Trip Endpoint" do 
  describe "can authenticate user and return data" do 
    it "Happy Path" do
      user = User.create!(email: "asdf@asdf.asdf", password: "asdf", api_key: "asdfasdfasdf" )
      request_body = {
                      origin: "Cincinnati, OH",
                      destination: "Chicago,IL", 
                      api_key: "asdfasdfasdf", 
                    }
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post "/api/v1/road_trip", params: JSON.generate(request_body), headers: headers
      
      expect(response.status).to eq 200

      body = JSON.parse(response.body, symbolize_names: true)[:data]
      require 'pry'; binding.pry
    end

    it "Sad Path" do 
      User.create!(email: "asdf@asdf.asdf", password: "asdf", api_key: "asdfasdfasdf" )
      request_body = {
                      origin: "Cincinnati, OH",
                      destination: "Chicago,IL", 
                      api_key: "asdf-asdf", 
                    }
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post "/api/v1/road_trip", params: JSON.generate(request_body), headers: headers

      expect(response.status).to eq 400

      body = JSON.parse(response.body, symbolize_names: true)[:errors]

      expect(body).to be_an Array
      expect(body[0][:status]).to eq("400")
      expect(body[0][:message]).to eq("Invalid Credentials")   
    end
  end
end





# RESPONCE
# {
#     "data": {
#         "id": "null",
#         "type": "road_trip",
#         "attributes": {
#             "start_city": "Cincinnati, OH",
#             "end_city": "Chicago, IL",
#             "travel_time": "04:40:45",
#             "weather_at_eta": {
#                 "datetime": "2023-04-07 23:00",
#                 "temperature": 44.2,
#                 "condition": "Cloudy with a chance of meatballs"
#             }
#         }
#     }
# }