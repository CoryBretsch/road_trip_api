require 'rails_helper'

RSpec.describe "Book-Search API endpoint" do 
  describe "Happy Path" do
    it "send book data for 5 books on a given location" do 
      location = "Denver, CO"
      quantity = 5
      headers = {"CONTENT_TYPE" => "application/json"}
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}", headers: headers

      expect(response).to be_successful

      book = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(book).to be_a Hash
      expect(book.keys.count).to be(3)
      expect(book).to have_key(:id)
      expect(book[:id]).to eq("null")
      expect(book).to have_key(:type)
      expect(book[:type]).to eq("books")
      expect(book).to have_key(:attributes)
      expect(book[:attributes]).to be_a Hash
      expect(book[:attributes].keys.count).to be(4)

      expect(book[:attributes]).to have_key(:destination)
      expect(book[:attributes][:destination]).to be_a String
      
      expect(book[:attributes]).to have_key(:forecast)
      expect(book[:attributes][:forecast]).to be_a Hash
      expect(book[:attributes][:forecast].keys.count).to be(2)
      expect(book[:attributes][:forecast]).to have_key(:summary)
      expect(book[:attributes][:forecast]).to have_key(:temperature)

      expect(book[:attributes]).to have_key(:total_books_found)
      expect(book[:attributes][:total_books_found]).to be_an Integer

      expect(book[:attributes]).to have_key(:books)
      expect(book[:attributes][:books]).to be_an Array      
      expect(book[:attributes][:books].count).to be(5)
      expect(book[:attributes][:books][0].keys.count).to be(3)
      expect(book[:attributes][:books][0]).to have_key(:isbn)
      expect(book[:attributes][:books][0][:isbn]).to be_an Array 
      expect(book[:attributes][:books][0]).to have_key(:title)
      expect(book[:attributes][:books][0][:title]).to be_a String
      expect(book[:attributes][:books][0]).to have_key(:publisher)
      expect(book[:attributes][:books][0][:publisher]).to be_an Array
    end
  end
end

