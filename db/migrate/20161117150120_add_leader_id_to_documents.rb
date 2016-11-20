class AddLeaderIdToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :leader_id, :integer
  end
end
