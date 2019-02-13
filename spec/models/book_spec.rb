require 'rails_helper'

describe Book, type: :model do
  describe 'class methods' do
    it 'average rating' do

      book1 = Book.create(title: 'book1')

      user = User.create(name: 'user1')
      review1 = book1.reviews.create(content: 'this is a review', rating: 4, user_id: user.id)
      review2 = book1.reviews.create(content: 'this is a review', rating: 3, user_id: user.id)
      review3 = book1.reviews.create(content: 'this is a review', rating: 1, user_id: user.id)

      average_rating = book1.average_rating.to_i

      expect(average_rating).to eq((review1.rating + review2.rating + review3.rating)/3)
    end
    it 'Highest rating' do

      book1 = Book.create(title: 'book1')

      user = User.create(name: 'user1')
      review1 = book1.reviews.create(content: 'this is a review', rating: 4, user_id: user.id)
      review2 = book1.reviews.create(content: 'this is a review', rating: 3, user_id: user.id)
      review3 = book1.reviews.create(content: 'this is a review', rating: 1, user_id: user.id)

      average_rating = book1.highest_rating.to_i

      expect(average_rating).to eq(review1.rating)
    end
  end
end
