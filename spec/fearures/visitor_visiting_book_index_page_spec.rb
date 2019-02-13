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



  # As a Visitor,
  # When I visit a book index page,
  # I see all book titles in the database,
  # And each book title is a link to that book's show page.
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
end
