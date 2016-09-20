class AddContactPhoneToAccomodations < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :contact_phone, :string
  end
end
