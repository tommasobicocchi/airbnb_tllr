class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # validates :name, presence: true
  # validates :description, presence: true
  # validates :daily_price, presence: true
  # validates :address, presence: true
end
