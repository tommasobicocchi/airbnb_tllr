class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true
  validates :description, presence: true
  validates_inclusion_of :rating, :in => [0, 1, 2, 3, 4, 5]
end
