class Emprestimo < ApplicationRecord
  belongs_to :aluno, :with_deleted => true
  belongs_to :livro, :with_deleted => true

  validates_presence_of :aluno_id, :livro_id

  scope :abertos, -> { where(data_devolucao: nil) }

  after_create :setar_aluno

  def setar_aluno
    livro.update_column(:aluno_id, aluno_id)
  end

  def limpar_aluno
    livro.update_column(:aluno_id, nil)
  end

  def devolver!
    update_column(:data_devolucao, Date.today)
    limpar_aluno
  end

  def aluno_nome
    "#{aluno.nome}#{(" (Removido)" if aluno.deleted?)}"
  end

  def livro_nome
    "#{livro.nome}#{( "(Removido)" if livro.deleted?)}"
  end

  def data_devolucao
    self[:data_devolucao].strftime("%d/%m/%Y") if self[:data_devolucao]
  end

  def data_emprestimo
    self[:data_emprestimo].strftime("%d/%m/%Y")
  end

end
