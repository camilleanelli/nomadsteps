class AddNomadlistUsernameToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :nomadlist_username, :string
  end
end
