class AddTripIdToAccomodations < ActiveRecord::Migration[5.0]
  def change
    add_reference :accomodations, :trip, foreign_key: true
  end
end
