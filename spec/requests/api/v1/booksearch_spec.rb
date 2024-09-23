require 'rails_helper'

RSpec.describe "Book-Search API endpoint" do 
  describe "Happy Path" do
    it "send book data for 5 books on a given location" do 
      location = "Denver, CO"
      quantity = 5
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}", headers: headers

      expect(response).to be_successful

      book = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry
    end
  end
end

