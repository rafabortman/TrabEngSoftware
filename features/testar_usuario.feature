Feature: Manage Usuarios
  In order to create a user
  As a person
  I want to be able to create an user

  Scenario: Visualize usuarios
    Given I have users titled "Usuario1, Usuario2, Usuario3, Usuario4"
    When I am on the list of "usuarios"
    Then I should see "Usuario1"
    And I should see "Usuario2"
    And I should see "Usuario3"
    And I should see "Usuario4"
  

    

  
