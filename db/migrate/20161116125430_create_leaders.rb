class CreateLeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :leaders do |t|
      t.string :name
      t.string :position
      t.integer :order
      t.text :resume

      t.timestamps
    end
  end
end
