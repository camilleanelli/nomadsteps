class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :transportation, foreign_key: true
      t.string :cloudinary_id

      t.timestamps
    end
  end
end
