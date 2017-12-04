Feature: login

Scenario: realizar login
    Given existe um usuario "Matheus" com senha "senha"
	And estou na pagina inicial
	When eu clico no link "Meu Perfil"
	Then eu devo ser redirecionado para a pagina "login"
	When preencho "Username" com "Matheus"
	And preencho "Password" com "senha"
	And clico no botao "Log in"
	Then devo estar logado