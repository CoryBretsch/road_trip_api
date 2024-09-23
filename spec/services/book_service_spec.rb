require 'rails_helper'

RSpec.describe "Book Service" do 
  it "hit library API and retrns books based on location sent" do 
    q = "Denver, CO"
    books = BookService.book_search(q)

    expect(books).to be_a Hash
    expect(books.keys.count).to eq 7
    expect(books[:docs]).to be_an Array
  end
end