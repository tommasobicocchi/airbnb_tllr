class AddFeaturesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :phone_number, :string
    add_column :users, :birthdate, :date
    add_column :users, :photo, :string
    add_column :users, :owner, :boolean
  end
end
