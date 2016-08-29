class AddGoogleInfoToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :google_info, :jsonb
  end
end
