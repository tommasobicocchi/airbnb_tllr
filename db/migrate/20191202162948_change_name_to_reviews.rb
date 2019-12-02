class ChangeNameToReviews < ActiveRecord::Migration[6.0]
  def change
  rename_column :reviews, :bookings_id, :booking_id
  end
end
