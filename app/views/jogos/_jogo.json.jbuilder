json.extract! jogo, :id, :titulo, :genero, :imagem, :created_at, :updated_at
json.url jogo_url(jogo, format: :json)
