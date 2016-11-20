class AddSelfNumberToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column(:documents, :self_number, :string)
  end
end
