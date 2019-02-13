class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    reviews.average(:rating)
  end
end
