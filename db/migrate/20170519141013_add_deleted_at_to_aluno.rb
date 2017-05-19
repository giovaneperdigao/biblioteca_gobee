class AddDeletedAtToAluno < ActiveRecord::Migration[5.0]
  def change
    add_column :alunos, :deleted_at, :datetime
    add_index :alunos, :deleted_at
    add_column :livros, :deleted_at, :datetime
    add_index :livros, :deleted_at
  end
end
