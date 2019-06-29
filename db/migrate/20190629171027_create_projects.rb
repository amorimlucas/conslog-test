class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :nome
      t.string :cliente
      t.date :data_de_conclusao
      t.string :estado

      t.timestamps
    end
  end
end
