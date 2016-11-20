class RemoveDeadlineFromDocuments < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :deadline, :date
  end
end
