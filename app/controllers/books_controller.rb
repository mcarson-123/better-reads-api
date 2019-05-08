class BooksController < ApplicationController

  def index
    books = Goodreads::Fetch.new(pagination_params).fetch_list

    render json: books
  end

  private

  def pagination_params
    params.permit(:page, :sort)
  end

end
