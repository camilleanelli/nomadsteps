class AddContactToAccomodations < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :contact, :string
  end
end
