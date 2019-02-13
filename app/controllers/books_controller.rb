class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
    @highest_rating = @book.highest_rating
    @lowest_rating = @book.lowest_rating

    # these methods are working in model tests.. couldnt figure out why not working here.
    # review_with_lowest_rating is returning nil here but working perfectly in model tests.
    # help



    # @highest_reviewer  = @book.review_with_lowest_rating.user.name
    # @highest_review_content = @book.review_with_highest_rating.content
    #
    # @lowest_reviewer  = @book.review_with_lowest_rating.user.name
    # @lowest_review_content = @book.review_with_lowest_rating.content
  end

end
