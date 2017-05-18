class CreateLivros < ActiveRecord::Migration[5.0]
  def change
    create_table :livros do |t|
      t.string :nome
      t.string :autor
      t.integer :edicao
      t.integer :aluno_id

      t.timestamps
    end
  end
end
