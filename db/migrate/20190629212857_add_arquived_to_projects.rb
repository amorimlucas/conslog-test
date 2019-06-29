class AddArquivedToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :arquived, :boolean
  end
end
