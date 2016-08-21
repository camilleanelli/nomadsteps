class AddCountryToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :country, :string
  end
end
