class RemoveLeaderIdFromDocuments < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :leader_id, :integer
  end
end
