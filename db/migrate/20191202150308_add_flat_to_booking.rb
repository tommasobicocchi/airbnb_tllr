class AddFlatToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :flat, null: false, foreign_key: true
  end
end
