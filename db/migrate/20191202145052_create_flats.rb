class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.integer :daily_price
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :users, null: false, foreign_key: true
      t.string :features

      t.timestamps
    end
  end
end
