Feature: Manage Usuarios
  In order to create a user
  As a person
  I want to be able to create an user

  Scenario: See usuario
    Given I have users titled "Usuario1, Usuario2, Usuario3, Usuario4"
    When I am on the list of "usuarios"
    And I am on the list of "Usuario1"
    When I click the link "Mostrar"
    Then I should see "Usuario1!"

  Scenario: Visualize usuarios
    Given I have users titled "Usuario1, Usuario2, Usuario3, Usuario4"
    When I am on the list of "usuarios"
    Then I should see "Usuario1"
    And I should see "Usuario2"
    And I should see "Usuario3"
    And I should see "Usuario4"
    
  Scenario: Create Valid Usuario
    Given I have no usuarios
    And I am on the list of "usuarios"
    When I click the link "Novo usuario"
    And I fill in "usuario_nome" with "Marshmello"
    And I fil in "usuario_nacionalidade" with "sou br"
    And I fill in "usuario_email" with "teste@gmail.com"
    And I fill in "usuario_nome_de_usuario" with "Marshmello"
    And I fill in "usuario_senha" with "senha123"
    And I fill in "usuario_confirmar_senha" with "senha123"
    And I click the button "Create Usuario"
    Then I should see "Usuario criado com sucesso"
  

    

  
