class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

    if !@book.reviews.empty?
      @reviews = @book.reviews
      @average_rating = @book.average_rating
      @highest_rating = @book.highest_rating
      @lowest_rating = @book.lowest_rating

      @review_with_highest_rating = @book.review_with_highest_rating.content
      @highest_reviewer  = @book.review_with_highest_rating.user.name

      @review_with_lowest_rating = @book.review_with_lowest_rating.content
      @lowest_reviewer  = @book.review_with_lowest_rating.user.name
    end
  end

end
