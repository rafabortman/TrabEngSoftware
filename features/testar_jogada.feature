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

Scenario: Create Valid Jogada
    Given I have no jogadas
    And I am on the list of "jogadas"
    And I have an user named "TestUser"
    And I have jogos titled "Teste1"
    When I click the link "Nova Jogada"
    And I fill in "jogada_texto_post" with "Post Teste"
    And I fill in "jogada_plataforma" with "PC"
    And I fill in the date field
    And I fill in "jogada_tempo_horas" with "1"
    And I fill in "jogada_tempo_minutos" with "2"
    And I fill in "jogada_tempo_segundos" with "3"
    And I fill in "milissegundos" with "4"
    And I fill in "jogada_link" with "https://www.youtube.com/embed/fEaTMekrcz0"
    And I fill in "jogada_categoria" with "Speedrun"
    And I fill in a valid jogada_usuario_id
    And I fill in a valid jogo_id
    And I click the button "Enviar"
    Then I should see "Jogada was successfully created"
    And I should see "Post Teste"

    