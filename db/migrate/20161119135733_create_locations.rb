class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :document_id
      t.integer :leader_id

      t.timestamps
    end
  end
end
