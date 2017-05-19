class Livro < ApplicationRecord
  acts_as_paranoid
  scope :disponiveis, -> { where(aluno_id: nil) }

  validates_presence_of :nome,:autor,:edicao
end
