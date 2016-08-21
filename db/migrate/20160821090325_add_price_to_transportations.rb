class AddPriceToTransportations < ActiveRecord::Migration[5.0]
  def change
    add_column :transportations, :price, :decimal
  end
end
