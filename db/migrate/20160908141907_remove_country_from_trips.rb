class RemoveCountryFromTrips < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :country, :string
  end
end
