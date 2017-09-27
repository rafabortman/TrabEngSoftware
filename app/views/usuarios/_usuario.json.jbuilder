json.extract! usuario, :id, :nome, :nacionalidade, :email, :username, :senha, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
