require 'rails_helper'

describe 'User visits book show page' do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'they see the books info' do
    it 'should show them the books title' do
      book = Book.create!(title: 'Walking in the Woods')
      user = User.create!(name: 'John Smith')
      book.reviews.create!(body: 'A', rating: 5, user: user)
      
      visit book_path(book)

      expect(page).to have_content(book.title)
    end

    it 'should show them the reviews' do
      book = Book.create!(title: 'Walking in the Woods')
      user = User.create!(name: 'John Smith')
      user2 = User.create!(name: 'Billy The Kid')
      review1 = book.reviews.create!(rating: 5, body: 'Enjoyable!', user: user)
      review2 = book.reviews.create!(rating: 1, body: 'Not enough gun fights.', user: user2)

      visit book_path(book)

      within('.reviews') do
        within("#review_#{review1.id}") do
          expect(page).to have_content(user.name)
          expect(page).to have_content(review1.rating)
          expect(page).to have_content(review1.body)
        end

        within("#review_#{review2.id}") do
          expect(page).to have_content(user2.name)
          expect(page).to have_content(review2.rating)
          expect(page).to have_content(review2.body)
        end
      end
    end

  end
end