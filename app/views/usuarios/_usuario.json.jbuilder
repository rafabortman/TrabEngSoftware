json.extract! usuario, :id, :nome, :email, :username, :senha, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
