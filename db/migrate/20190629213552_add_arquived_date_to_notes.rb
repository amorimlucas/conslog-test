class AddArquivedDateToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :arquived_date, :date
  end
end
