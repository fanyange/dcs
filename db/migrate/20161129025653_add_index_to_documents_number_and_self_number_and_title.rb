class AddIndexToDocumentsNumberAndSelfNumberAndTitle < ActiveRecord::Migration[5.0]
  def change
    add_index :documents, :title, unique: true
    add_index :documents, :number
    add_index :documents, :self_number
  end
end
