class Profile < ApplicationRecord
  belongs_to :user
  has_many :lists
  has_many :reviews
end
