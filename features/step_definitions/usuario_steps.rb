Given("existe um usuario {string} com senha {string}" ) do |username,senha|
	Usuario.create!(
	  nome:username,
	  email:username+"@gmail.com",
	  username:username,
	  senha:senha,
	  nacionalidade:"soubr",
	  confirmar_senha:senha)
end

When("I click the button {string}") do |button|
  click_button (button)
end

When("I visualize the usuario {string}") do |usuarioUsername|
     idUsuario = Usuario.where(["texto_post = ?", usuarioUsername]).first.id.to_s
     visit '/usuario/'+idUsuario
end

Then("I should see {string}") do |textValue|
  expect(page).to have_content (textValue)
end

Given("I am on the list of {string}") do |pageName|
  visit '/'+pageName
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
        confirmar_senha:senha)
  end
end

When("I fill in {string} with {string}") do |fieldName, fieldValue|
  fill_in fieldName, with: fieldValue
end


