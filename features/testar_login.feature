Feature: login

Scenario: realizar login
	Given existe um usuario "Matheus" com senha "1234"
	And estou na pagina inicial
	When eu clico no link "Meu Perfil"
	Then eu devo ser redirecionado para a pagina "login"
	When preencho "Username" com "Matheus"
	And preencho "Password" com "1234"
	And clico no botao "Log in"
	Then devo estar logado