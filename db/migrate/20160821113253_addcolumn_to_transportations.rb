class AddcolumnToTransportations < ActiveRecord::Migration[5.0]
  def change
    add_column :transportations, :arrival_datetime, :datetime
  end
end
