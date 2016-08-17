class CreateAccomodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accomodations do |t|
      t.string :accomodation_type
      t.date :start_date
      t.date :end_date
      t.decimal :price
      t.string :link
      t.integer :number_of_persons

      t.timestamps
    end
  end
end
