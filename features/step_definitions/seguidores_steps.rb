Given("{string} segue {string}") do |seguidor, seguido|
	seguidor_id = Usuario.find_by(username: seguidor).id
	seguido_id = Usuario.find_by(username: seguido).id
	Amigo.create!(usuario_id:seguidor_id,amigo_id:seguido_id)
end

When("{string} para de seguir {string}") do |seguidor,seguido|
	seguidor_id = Usuario.find_by(username: seguidor).id
	seguido_id = Usuario.find_by(username: seguido).id
	relacao = Amigo.find_by(usuario_id:seguidor_id,amigo_id:seguido_id)
	relacao.destroy
end