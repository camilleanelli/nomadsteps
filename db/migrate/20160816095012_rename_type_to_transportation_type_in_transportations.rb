class RenameTypeToTransportationTypeInTransportations < ActiveRecord::Migration[5.0]
  def change
    rename_column :transportations, :type, :transportation_type
  end
end
