class CreateJoinTableTransportationUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :transportations, :users do |t|
       t.index [:transportation_id, :user_id]
       t.index [:user_id, :transportation_id]
    end
  end
end
