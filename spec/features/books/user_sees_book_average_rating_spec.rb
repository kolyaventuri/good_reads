require 'rails_helper'

describe 'User visits the book show page' do
  before(:all) do
    DatabaseCleaner.clean
    book = Book.create!(title: 'Walking in the Woods')
    user = User.create!(name: 'John Smith')
    user2 = User.create!(name: 'Billy The Kid')
    book.reviews.create!(rating: 5, body: 'Enjoyable!', user: user)
    book.reviews.create!(rating: 4, body: 'Enjoyable!', user: user)
    book.reviews.create!(rating: 1, body: 'Not enough gun fights.', user: user2)
    book.reviews.create!(rating: 4, body: 'Not enough gun fights.', user: user2)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it 'should display the average rating for the book' do
    visit book_path(Book.first)

    expect(page).to have_content("Average Rating: #{Book.first.average_rating}")
  end
end