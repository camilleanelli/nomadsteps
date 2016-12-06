class CreateJoinTableAccomodationUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :accomodations, :users do |t|
      t.index [:accomodation_id, :user_id]
      t.index [:user_id, :accomodation_id]
    end
  end
end
