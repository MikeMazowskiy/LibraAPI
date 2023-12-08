class Book < ApplicationRecord
  has_many :lists_books
  has_many :lists, through: :lists_books
end
