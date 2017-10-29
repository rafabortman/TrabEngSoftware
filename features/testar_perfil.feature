Feature: perfil

Scenario: acessar meu perfil sem estar logado
	Given estou na pagina inicial
	When eu clico no link "Meu Perfil"
	Then eu devo ser redirecionado para a pagina "login"

Scenario: acessar meu perfil logado
	Given estou logado como "Matheus"
	When eu clico no link "Meu Perfil"
	Then devo ver "Matheus"
	And devo ver "Nome"
	And devo ver "Nacionalidade" 

Scenario: verificar quem eu sigo
	Given estou logado como "Matheus"
	And existe um usuario "Joao" com senha "12345"
	And "Matheus" segue "Joao"
	When eu clico no link "Meu Perfil"
	Then devo ver "Joao"

Scenario: verificar seguidores
	Given estou logado como "Matheus"
	And existe um usuario "Chico" com senha "12321"
	And "Chico" segue "Matheus"
	When eu clico no link "Meu Perfil"
	Then devo ver "Chico"

Scenario: seguidor parar de seguir
	Given estou logado como "Matheus"
	And existe um usuario "Maria" com senha "aaa222"
	And "Maria" segue "Matheus"
	When "Maria" para de seguir "Matheus"
	And eu clico no link "Meu Perfil"
	Then nao devo ver "Maria"