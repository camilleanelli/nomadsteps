class AddFilepickerUrlToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :filepicker_url, :string
  end
end
