class AddCityDetailsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :city_details, :string
  end
end
