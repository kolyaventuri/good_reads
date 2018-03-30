# Book
class Book < ApplicationRecord
  validates_presence_of :title

  has_many :reviews
end
