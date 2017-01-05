class AddCommentToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :comment, :text
  end
end
