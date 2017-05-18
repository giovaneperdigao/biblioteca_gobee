json.extract! aluno, :id, :nome, :livro_id, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
