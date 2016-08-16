class AddTripIdToTransportations < ActiveRecord::Migration[5.0]
  def change
    add_reference :transportations, :trip, foreign_key: true
  end
end
