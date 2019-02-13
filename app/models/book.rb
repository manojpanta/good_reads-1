class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end

  def highest_rating
    reviews.maximum(:rating)
  end

  def lowest_rating
    reviews.minimum(:rating)
  end

  def review_with_highest_rating
    reviews.find_by(rating: highest_rating)
  end

  def review_with_lowest_rating
    reviews.find_by(rating: lowest_rating)
  end
end
