class AddCityNameToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :city_name, :string
  end
end
