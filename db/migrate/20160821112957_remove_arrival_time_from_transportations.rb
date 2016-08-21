class RemoveArrivalTimeFromTransportations < ActiveRecord::Migration[5.0]
  def change
    remove_column :transportations, :arrival_time, :time
  end
end
