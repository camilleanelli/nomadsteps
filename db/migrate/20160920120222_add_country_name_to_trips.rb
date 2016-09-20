class AddCountryNameToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :country_name, :string
  end
end
