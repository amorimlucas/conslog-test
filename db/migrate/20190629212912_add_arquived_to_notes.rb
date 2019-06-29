class AddArquivedToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :arquived, :boolean
  end
end
