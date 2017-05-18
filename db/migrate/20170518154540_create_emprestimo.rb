class CreateEmprestimo < ActiveRecord::Migration[5.0]
  def change
    create_table :emprestimos do |t|
      t.string :emprestimo
      t.integer :aluno_id
      t.integer :livro_id
      t.date :data_emprestimo
      t.date :data_devolucao
    end
  end
end
