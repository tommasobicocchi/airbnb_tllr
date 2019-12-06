class AddPhotoToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :photo, :string
  end
end
