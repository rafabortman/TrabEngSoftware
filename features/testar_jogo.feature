Feature: Manage Jogos
  In order to make a jogo
  As an user
  I want to create and manage jogos

  Scenario: Visualize jogos
    Given I have jogos titled "Teste1,Teste2"
    When I am on the list of "jogos"
    Then I should see "Teste1"
    And I should see "Teste2"
  
  Scenario: Create Valid Jogo
    Given I have no jogos
    And I am on the list of "jogos"
    When I click the link "Novo Jogo"
    And I fill in "jogo_titulo" with "Cuphead"
    And I fill in "jogo_imagem" with "https://addons.cdn.mozilla.net/user-media/addon_icons/7/7560-64.png?modified=1508595621"
    And I fill in "jogo_descricao" with "Shooter"
    When I click the button "Create Jogo"
    Then I should see "Jogo foi criado com sucesso"
    And I should see "Cuphead"

  Scenario: Sinalize invalid input
    Given I have no jogos
    And I am on the list of "jogos"
    When I click the link "Novo Jogo"
    Then I click the button "Create Jogo"
    Then I should see "Titulo não pode estar vazio"
    And I should see "Imagem -> não foi possível carregar"

  Scenario: Visualize Ranking of players
    Given I have no jogos
    Given I have jogos titled "MarioBros"
    And I have an user named "TestUser1"
    And I have an user named "TestUser2"
    And "TestUser1" has a jogada called "TestPlay1" of "MarioBros" game
    And "TestUser2" has a jogada called "TestPlay2" of "MarioBros" game
    When I am on the list of "jogos"
    And I click the link "Mostrar"
    Then I should see "1º"
    And I should see "2º"
    And I should see "TestUser1"
    And I should see "TestUser2"
    And I should not see "3º"

  
