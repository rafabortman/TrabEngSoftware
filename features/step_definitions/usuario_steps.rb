Given("existe um usuario {string} com senha {string}" ) do |username,senha|
	Usuario.create!(nome:username,email:username+"@gmail.com",username:username,senha:senha,nacionalidade:"kingofthenorth",confirmar_senha:senha)
end