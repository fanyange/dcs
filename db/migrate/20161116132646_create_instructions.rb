class CreateInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :instructions do |t|
      t.text :content
      t.date :deadline
      t.integer :document_id
      t.integer :leader_id

      t.timestamps
    end
  end
end
