class AddImageTripToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :image_trip, :string
  end
end
