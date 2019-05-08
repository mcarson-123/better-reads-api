require 'net/http'

module Goodreads
  class Fetch
    def initialize(params)
      @sort = params[:sort]
      @page = params[:page]
    end

    def fetch_list
      query_string = "https://www.goodreads.com/review/list" +
                     "?v=2&id=6754163" +
                     "&shelf=on-cloud" +
                     "&key=#{ENV["GOODREADS_API_KEY"]}" +
                     "&per_page=10"

      query_string << "&sort=#{@sort}" if @sort
      query_string << "&page=#{@page}" if @page

      uri = URI(query_string)
      response = Net::HTTP.get(uri)
      response_hash = Hash.from_xml(response)

      reviews_count = response_hash.dig("GoodreadsResponse", "reviews", "total")
      reviews = response_hash.dig("GoodreadsResponse", "reviews", "review")

      book_list = reviews.map do |review|
        {
          id: review["id"].try(:to_i),
          title: review.dig("book", "title"),
          average_rating: review.dig("book", "average_rating").try(:to_f),
          image_url: review.dig("book", "image_url")
        }
      end

      {
        books: book_list,
        book_total_count: reviews_count
      }
    end
  end
end
