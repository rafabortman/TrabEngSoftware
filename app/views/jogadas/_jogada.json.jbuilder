json.extract! jogada, :id, :texto_post, :plataforma, :data, :tempo_horas, :tempo_minutos, :tempo_segundos,:milissegundos, :categoria, :link, :usuario_id, :jogo_id, :hackrom_id, :created_at, :updated_at
json.url jogada_url(jogada, format: :json)
