class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :destination

      t.timestamps
    end
  end
end
