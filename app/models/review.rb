class Review < ApplicationRecord

  STARS = %w(1 2 3 4 5)

  belongs_to :movie
  validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  validates :stars, numericality: { greater_than: 0, less_than_or_equal_to: 5,  only_integer: true, message: "must be between 1 and 5" }
end
