class AddIndexToLocationsAllFields < ActiveRecord::Migration[5.0]
  def change
    add_index :locations, :document_id
    add_index :locations, :leader_id
  end
end
