require 'rails_helper'

RSpec.describe "Users Endpoint" do 
  describe "Can create a user and return an api_key" do 
    it "Happy Path" do
      request_body = {
                      email: "whatever@example.com", 
                      password: "password", 
                      password_confirmation: "password"
                    }
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post "/api/v1/users", params: JSON.generate(request_body), headers: headers

      expect(response.status).to eq 201

      user = User.last
      user_data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user_data.keys.count).to eq(3)
      expect(user_data[:type]).to eq("user")
      expect(user_data[:id]).to eq(user.id.to_s)
      expect(user_data[:attributes].keys.count).to eq(2)
      expect(user_data[:attributes][:email]).to eq(user.email)
      expect(user_data[:attributes][:api_key]).to eq(user.api_key)
    end

    it "Sad Path" do 
      request_body = {
        password: "password", 
        password_confirmation: "password"
                    }
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post "/api/v1/users", params: JSON.generate(request_body), headers: headers

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      
      data = JSON.parse(response.body, symbolize_names: true)[:errors]

      expect(data).to be_an Array
      expect(data[0][:status]).to eq("400")
      expect(data[0][:message]).to eq("Validation failed: Email can't be blank")      
    end
  end
end








# response

# status: 201
# body:

# {
#   "data": {
#     "type": "user",
#     "id": "1",
#     "attributes": {
#       "email": "whatever@example.com",
#       "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
#     }
#   }
# }