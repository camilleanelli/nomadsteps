class AddFirstNameToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :first_name, :string
  end
end
