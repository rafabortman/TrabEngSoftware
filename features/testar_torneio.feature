Feature: Torneios

Scenario: ir ate a pagina de torneio
    Given estou logado como "Matheus"
    And estou na pagina inicial
    When eu clico no link "Torneios"
    Then eu devo ser redirecionado para a pagina "torneios"
    And devo ver "Novo torneio"
    When eu clico no link "Novo torneio"
    Then eu devo ser redirecionado para a pagina "torneios/new"

Scenario: adicionar jogada sem estar logado
    Given existe um torneio com titulo "torneio" do jogo "MarioBros"
    And estou na pagina inicial
    When eu clico no link "Torneios"
    Then eu devo ser redirecionado para a pagina "torneios"
    And nao devo ver "Add Jogada"
        
Scenario: adicionar e ver jogada logado
    Given existe um torneio com titulo "torneio" do jogo "MarioBros"
    And estou logado como "Matheus"
    And estou na pagina inicial
    When eu clico no link "Torneios"
    Then eu devo ser redirecionado para a pagina "torneios"
    And devo ver "Add jogada"
    When eu clico no link "Add jogada"
    Then eu devo ser redirecionado para a pagina "jogadaTorneio"
    When preencho "jogada_torneio" com "https://www.youtube.com/embed/R31_NzvkJmY"
    And clico no botao "Save Post"
    Then eu devo ser redirecionado para a pagina "torneios"
    And devo ver "Matheus"


  
