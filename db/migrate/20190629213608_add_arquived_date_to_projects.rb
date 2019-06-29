class AddArquivedDateToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :arquived_date, :date
  end
end
