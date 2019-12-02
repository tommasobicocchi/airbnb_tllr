class ChangeNameToFlats < ActiveRecord::Migration[6.0]
  def change
    rename_column :flats, :users_id, :user_id
  end
end
