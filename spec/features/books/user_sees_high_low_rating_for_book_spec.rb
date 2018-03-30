require 'rails_helper'

describe 'User visits the book show page' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it 'should display the highest and lowest ratings' do
    book = Book.create!(title: 'Walking in the Woods')
    user = User.create!(name: 'John Smith')
    user2 = User.create!(name: 'Billy The Kid')
    highest = book.reviews.create!(rating: 5, body: 'Enjoyable!', user: user)
    book.reviews.create!(rating: 4, body: 'Enjoyable!', user: user)
    lowest = book.reviews.create!(rating: 1, body: 'Not enough gun fights.', user: user2)
    book.reviews.create!(rating: 4, body: 'Not enough gun fights.', user: user2)

    visit book_path(Book.first)

    within('#highest_rating') do
      expect(page).to have_content("Highest Rating: #{highest.rating}")
      expect(page).to have_content(user.name)
      expect(page).to have_content(highest.body)
    end

    within('#lowest_rating') do
      expect(page).to have_content("Lowest Rating: #{lowest.rating}")
      expect(page).to have_content(user2.name)
      expect(page).to have_content(lowest.body)
    end
  end
end