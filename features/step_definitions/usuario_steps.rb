Given("existe um usuario {string} com senha {string}" ) do |username,senha|
	Usuario.create!(
	  nome:username,
	  email:username+"@gmail.com",
	  username:username,
	  senha:senha,
	  nacionalidade:"soubr",
	  confirmar_senha:senha,
    imagem_perfil:"qpeioasd")
end

Given("I have a user called {string}") do |username|
  Usuario.create!(
	  nome:username,
	  email:username+"@gmail.com",
	  username:username,
	  senha:"senha",
	  nacionalidade:"soubr",
	  confirmar_senha:"senha",
    imagem_perfil:"qpeioasd")
end



When("I visualize the usuario {string}") do |usuarioUsername|
     idUsuario = Usuario.where(["texto_post = ?", usuarioUsername]).first.id.to_s
     visit '/usuario/'+idUsuario
end

Given("I have no Usuarios") do
  Usuario.delete_all
end

When("I click the link {string}") do |clickableLink|
  click_link (clickableLink)
end

Given("i have users named {string}") do |string|
  string.split(',').each do |usuario|
    Usuario.create!(
        nome:username,
        email:username+"@gmail.com",
        username:username,
        senha:senha,
        nacionalidade:"inglês",
        confirmar_senha:senha,
        imagem_perfil:"qpeioasd")
  end
end

When("I fill in {string} with {string}") do |fieldName, fieldValue|
  fill_in fieldName, with: fieldValue
end

Given("I have no usuarios") do
  Usuario.delete_all
end


