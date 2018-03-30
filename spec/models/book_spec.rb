require 'rails_helper'

describe Book, type: :model do
  before(:all) do
    DatabaseCleaner.clean
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  describe 'valiations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { is_expected.to have_many(:reviews) }
  end

  describe 'methods' do
    it 'should be able to calculate average rating' do
      book = Book.create!(title: 'Walking in the Woods')
      user = User.create!(name: 'John Smith')
      user2 = User.create!(name: 'Billy The Kid')
      book.reviews.create!(rating: 5, body: 'Enjoyable!', user: user)
      book.reviews.create!(rating: 4, body: 'Enjoyable!', user: user)
      book.reviews.create!(rating: 1, body: 'Not enough gun fights.', user: user2)
      book.reviews.create!(rating: 4, body: 'Not enough gun fights.', user: user2)

      expect(book.average_rating).to be(3.5)
    end
  end
end
