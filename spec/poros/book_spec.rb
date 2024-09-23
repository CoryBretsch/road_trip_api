require 'rails_helper'

RSpec.describe Book do 
  it "creates a book poro" do 
    attr = {
              "author_key": [
                  "OL2843451A"
              ],
              "author_name": [
                  "Universal Map"
              ],
              "ebook_access": "no_ebook",
              "ebook_count_i": 0,
              "edition_count": 1,
              "edition_key": [
                  "OL10909613M"
              ],
              "first_publish_year": 2001,
              "format": [
                  "Paperback"
              ],
              "has_fulltext": false,
              "isbn": [
                  "9780762507849",
                  "0762507845"
              ],
              "key": "/works/OL8503198W",
              "language": [
                  "eng"
              ],
              "last_modified_i": 1338943517,
              "public_scan_b": false,
              "publish_date": [
                  "January 2001"
              ],
              "publish_year": [
                  2001
              ],
              "publisher": [
                  "Universal Map Enterprises"
              ],
              "seed": [
                  "/books/OL10909613M",
                  "/works/OL8503198W",
                  "/authors/OL2843451A"
              ],
              "title": "Denver, Co",
              "title_suggest": "Denver, Co",
              "title_sort": "Denver, Co",
              "type": "work",
              "publisher_facet": [
                  "Universal Map Enterprises"
              ],
              "_version_": 1795929215941476352,
              "author_facet": [
                  "OL2843451A Universal Map"
              ]
            }

    book = Book.new(attr)

    expect(book).to be_a Book 
    expect(book.isbn).to eq([
      "9780762507849",
      "0762507845"])
    expect(book.title).to eq("Denver, Co")
    expect(book.publisher).to eq([
      "Universal Map Enterprises"
  ])

  end
end