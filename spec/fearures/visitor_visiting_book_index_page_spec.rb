require 'rails_helper'

describe 'visitor visiting book index' do
  it 'shows all the titles for books with link to book show page' do
    book1 = Book.create(title: 'book1')
    book2 = Book.create(title: 'book2')


    visit '/books'

    expect(page).to have_content(book1.title)
    expect(page).to have_content(book2.title)

    click_on book1.title

    expect(current_path).to eq("/books/#{book1.id}")
  end
end
describe 'visitor visiting book show ' do
  it ' shows list of reviews for the book' do
    book1 = Book.create(title: 'book1')
    user = User.create(name: 'user1')
    review = book1.reviews.create(content: 'this is a review', rating: 4, user_id: user.id)

    visit "/books/#{book1.id}"

    expect(page).to have_content(book1.title)
    expect(page).to have_content("#{review.content} by #{user.id} with rating: #{review.rating}")
    expect(page).to have_content("")

  end

  it ' shows average rating for the book' do
    book1 = Book.create(title: 'book1')

    user = User.create(name: 'user1')
    review1 = book1.reviews.create(content: 'this is a review', rating: 4, user_id: user.id)
    review2 = book1.reviews.create(content: 'this is a review', rating: 3, user_id: user.id)
    review3 = book1.reviews.create(content: 'this is a review', rating: 1, user_id: user.id)

    visit "/books/#{book1.id}"

    expect(page).to have_content("Average rating: #{(review1.rating + review2.rating + review3.rating)/3}")


  end

  it ' shows highest rating for the book' do
    book1 = Book.create(title: 'book1')

    user = User.create(name: 'user1')
    review1 = book1.reviews.create(content: 'this is a review', rating: 5, user_id: user.id)
    review2 = book1.reviews.create(content: 'this is a review', rating: 3, user_id: user.id)
    review3 = book1.reviews.create(content: 'this is a review', rating: 1, user_id: user.id)

    visit "/books/#{book1.id}"

    expect(page).to have_content("Highest rating: #{review1.rating}")
    expect(page).to have_content("#{review1.content} by #{user.name}")
  end

  it ' shows lowest rating for the book' do

    book1 = Book.create(title: 'book1')

    user = User.create(name: 'user1')

    review1 = book1.reviews.create(content: 'this is a review', rating: 4, user_id: user.id)
    review2 = book1.reviews.create(content: 'this is a review', rating: 3, user_id: user.id)
    review3 = book1.reviews.create(content: 'this is a review', rating: 1, user_id: user.id)

    visit "/books/#{book1.id}"

    expect(page).to have_content("Lowest rating: #{review3.rating}")
    expect(page).to have_content("#{review3.content} by #{user.name}")
  end


end
