class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :daily_price, presence: true
  validates :address, presence: true
end
