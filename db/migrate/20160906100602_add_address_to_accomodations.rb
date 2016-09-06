class AddAddressToAccomodations < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :address, :string
  end
end
