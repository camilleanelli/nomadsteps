class AddLongitudeAndLatitudeToAccomodations < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :longitude, :float
    add_column :accomodations, :latitude, :float
  end
end
