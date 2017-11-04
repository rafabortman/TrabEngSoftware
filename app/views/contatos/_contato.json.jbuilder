json.extract! contato, :id, :email, :assunto, :corpo, :created_at, :updated_at
json.url contato_url(contato, format: :json)
