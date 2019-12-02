class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
end
