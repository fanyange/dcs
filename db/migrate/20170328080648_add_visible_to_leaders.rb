class AddVisibleToLeaders < ActiveRecord::Migration[5.0]
  def change
    add_column :leaders, :visible, :boolean, default: true
  end
end
