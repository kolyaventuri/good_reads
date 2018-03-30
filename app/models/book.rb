# Book
class Book < ApplicationRecord
  validates_presence_of :title

  has_many :reviews

  def average_rating
    reviews.average(:rating).to_f
  end

  def highest_rating
    rating = reviews.maximum(:rating)
    reviews.where(rating: rating).order('id DESC').first
  end

  def lowest_rating
    rating = reviews.minimum(:rating)
    reviews.where(rating: rating).order('id DESC').first
  end
end
