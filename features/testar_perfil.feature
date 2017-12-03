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
	And I have a user called "Joao"
	And "Matheus" segue "Joao"
	When eu clico no link "Meu Perfil"
	Then devo ver "Joao"

Scenario: verificar seguidores
	Given estou logado como "Matheus"
    And I have a user called "Chico"
	And "Chico" segue "Matheus"
	When eu clico no link "Meu Perfil"
	Then devo ver "Chico"

Scenario: seguidor parar de seguir
	Given estou logado como "Matheus"
    And I have a user called "Maria"
	And "Maria" segue "Matheus"
	When "Maria" para de seguir "Matheus"
	And eu clico no link "Meu Perfil"
	Then nao devo ver "Maria"