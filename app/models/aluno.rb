class Aluno < ApplicationRecord
  has_one :livro
  has_many :emprestimos

  validates_presence_of :nome

  def livro_atual
    livro.nil? ? "Nenhum livro com o aluno" : livro.nome
  end

  def self.sem_livros
    includes(:livro).references(:livro).where("livros.id IS NULL")
  end

end
