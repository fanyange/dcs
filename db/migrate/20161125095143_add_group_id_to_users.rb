class AddGroupIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :group_id, :integer
    add_index :users, :group_id
  end
end
