class Emprestimo < ApplicationRecord
  belongs_to :aluno
  belongs_to :livro

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

end
