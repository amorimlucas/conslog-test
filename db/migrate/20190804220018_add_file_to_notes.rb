class AddFileToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :file, :string
  end
end
