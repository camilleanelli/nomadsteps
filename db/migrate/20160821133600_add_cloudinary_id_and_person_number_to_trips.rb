class AddCloudinaryIdAndPersonNumberToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :cloudinary_id, :string
    add_column :trips, :person_number, :integer
  end
end
