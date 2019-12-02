class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :checkin_date
      t.date :checkout_date
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
