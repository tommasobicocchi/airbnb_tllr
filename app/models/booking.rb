class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validate :no_booking_overlap


def no_booking_overlap
  if (Booking.where("(? BETWEEN checkin_date AND checkout_date OR ? BETWEEN checkin_date AND checkout_date) AND user_id = ?", self.checkin_date, self.checkout_date, self.user_id).any?)
     errors.add(:checkout_date, 'it overlaps another reservation')
  end
end

end
