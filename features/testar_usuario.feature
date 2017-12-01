Feature: Manage Usuarios
  In order to create a user
  As a person
  I want to be able to create an user

  Scenario: See usuario
    Given I have users titled "Usuario1, Usuario2, Usuario3, Usuario4"
    When I am in the page of "Buscar Usuarios"
    And I fill in "search_username" with "Usuario1"
    When I click the link "Buscar"
    Then I should see "Usuario1!"

  Scenario: Create Valid Usuario
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Usuario criado com sucesso"
    
  Scenario: Create Invalid Usuario with empty nome
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Nome deve ser preenchido" 
    
  Scenario: Create Invalid Usuario with empty nacionalidade
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Nacionalidade deve ser preenchido" 
    
  Scenario: Create Invalid Usuario with empty email
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Email deve ser preenchido"
    And I should see "Email is invalid"
    
  Scenario: Create Invalid Usuario with wrong email
    And I am on the list of "usuarios"
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Email is invalid"
    
  Scenario: Create Invalid Usuario with empty username
    Given I have no usuarios
    And I am on the list of "usuarios"
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Username deve ser preenchido" 
    
  Scenario: Create Invalid Usuario with empty senha
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Senha deve ser preenchifo"
    And I should see "Senha deve ter pelo menos 4 caracteres"
    And I should see "Senha precisa ser igual a confirmacao de senha"
    
  Scenario: Create Invalid Usuario with wrong senha
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "1"
    And I fill in "usuario_confirmar_senha" with "1"
    And I click the button "Create Usuario"
    Then I should see "Senha deve ter pelo menos 4 caracteres"
    
  Scenario: Create Invalid Usuario with wrong senha
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "2"
    And I fill in "usuario_confirmar_senha" with "2"
    And I click the button "Create Usuario"
    Then I should see "Senha deve ter pelo menos 4 caracteres"
    
  Scenario: Create Invalid Usuario with wrong confirmacao senha
    Given I have no usuarios
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "3"
    And I fill in "usuario_confirmar_senha" with "3"
    And I click the button "Create Usuario"
    Then I should see "Senha deve ter pelo menos 4 caracteres" 

  

    

  
