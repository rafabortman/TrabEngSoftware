Given("estou logado como {string}") do |nome|
  steps %Q{
    Given existe um usuario "#{nome}" com senha "1234"
	And estou na pagina inicial
	When eu clico no link "Meu Perfil"
	Then eu devo ser redirecionado para a pagina "login"
	When preencho "Username" com "#{nome}"
	And preencho "Password" com "1234"
	And clico no botao "Log in"
	Then devo estar logado
  }
end

Then("devo estar logado") do
	expect(page).to have_link("Logout")
end
