json.extract! jogo, :id, :titulo, :imagem, :imagem_url, :descricao, :created_at, :updated_at
json.url jogo_url(jogo, format: :json)
