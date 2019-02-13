class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
  end

end
