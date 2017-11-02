Feature: Manage Jogadas
  In order to manage jogadas
  As an user
  I want to create, share and manage jogadas

Scenario: Share jogada
    Given I have an user named "Fallen"
    And I have jogos titled "Teste1"
    And I am on the list of "jogadas"
    And I have a jogada called "TestPlay"
    When I visualize the jogada "TestPlay"
    And I click the link "btn_share_facebook"
    Then I should see "Jogada compartilhada!"

