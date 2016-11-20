class RenameFilenameToTitleFileidToNumberFromDocuments < ActiveRecord::Migration[5.0]
  def change
    rename_column(:documents, :filename, :title)
    rename_column(:documents, :fileid, :number)
  end
end
