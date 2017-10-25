Feature: Manage Jogos
  In order to make a jogo
  As an user
  I want to create and manage jogos

  Scenario: title
    Given i have jogos titled "Teste1,Teste2"
    When I am on the list of "jogos"
    Then I should see "Teste1"
    And I should see "Teste2"
  
  
  Scenario: Create Valid Jogo
    Given I have no jogos
    And I am on the list of "jogos"
    When I click the link "Novo Jogo"
    And I fill in "jogo_titulo" with "Cuphead"
    And I fill in "jogo_imagem" with "https://pbs.twimg.com/profile_images/874026752250478592/A-Bs-WB8.jpg"
    And I fill in "jogo_descricao" with "Shooter"
    When I click the button "Create Jogo"
    Then I should see "Jogo foi criado com sucesso"
    And I should see "Cuphead"
