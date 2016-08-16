class CreateTransportations < ActiveRecord::Migration[5.0]
  def change
    create_table :transportations do |t|
      t.string :type
      t.string :reference_number
      t.string :link
      t.datetime :departure_datetime
      t.time :arrival_time
      t.string :departure_city
      t.string :company

      t.timestamps
    end
  end
end
