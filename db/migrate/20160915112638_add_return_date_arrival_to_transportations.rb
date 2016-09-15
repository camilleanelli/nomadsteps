class AddReturnDateArrivalToTransportations < ActiveRecord::Migration[5.0]
  def change
    add_column :transportations, :return_date_arrival, :datetime
  end
end
