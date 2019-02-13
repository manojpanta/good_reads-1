class Review < ApplicationRecord
  validates_presence_of :content, :rating

  belongs_to :user
  belongs_to :book
end
