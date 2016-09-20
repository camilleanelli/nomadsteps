class AddContactEmailToAccomodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :contact_email, :string
  end
end
