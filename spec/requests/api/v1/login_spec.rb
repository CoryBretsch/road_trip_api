require 'rails_helper'

RSpec.describe "User Login Endpoint" do 
  describe "can return users email and api_key" do 
    it "Happy Path" do
      user = User.create!(email: "asdf@asdf.asdf", password: "asdf", api_key: "asdfasdfasdf" )
      request_body = {
                      email: "asdf@asdf.asdf", 
                      password: "asdf", 
                    }
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post "/api/v1/sessions", params: JSON.generate(request_body), headers: headers

      expect(response.status).to eq 200

      body = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(body.keys.count).to eq(3)
      expect(body[:type]).to eq("user")
      expect(body[:id]).to eq(user.id.to_s)
      expect(body[:attributes].keys.count).to eq(2)
      expect(body[:attributes][:email]).to eq(user.email)
      expect(body[:attributes][:api_key]).to eq(user.api_key)
    end

    it "Sad Path" do 
      user = User.create!(email: "asdf@asdf.asdf", password: "asdf", api_key: "asdfasdfasdf" )
      request_body = {
                      email: "asdf@asdf.asdf", 
                      password: "asdf123", 
                    }
      headers = {"CONTENT_TYPE" => "application/json", "ACCEPT" => "application/json"}
      post "/api/v1/sessions", params: JSON.generate(request_body), headers: headers

      expect(response.status).to eq 400

      body = JSON.parse(response.body, symbolize_names: true)[:errors]

      expect(body).to be_an Array
      expect(body[0][:status]).to eq("400")
      expect(body[0][:message]).to eq("Invalid Credentials")      
    end
  end
end