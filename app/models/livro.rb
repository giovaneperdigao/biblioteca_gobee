class Livro < ApplicationRecord
  scope :disponiveis, -> { where(aluno_id: nil) }

  validates_presence_of :nome,:autor,:edicao
end
