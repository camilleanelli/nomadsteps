class AddContactNameToAccomodations < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :contact_name, :string
  end
end
