json.extract! livro, :id, :nome, :autor, :edicao, :created_at, :updated_at
json.url livro_url(livro, format: :json)
