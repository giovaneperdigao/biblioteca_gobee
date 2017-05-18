class Aluno < ApplicationRecord
  has_one :livro

  def livro_atual
    livro.nil? ? "Nenhum livro com o aluno" : livro.nome
  end
end
