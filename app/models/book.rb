# Book
class Book < ApplicationRecord
  validates_presence_of :title

  has_many :reviews

  def average_rating
    reviews.average(:rating).to_f
  end
end
