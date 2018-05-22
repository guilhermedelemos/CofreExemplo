# language: en
Feature: Travado
  Como um usuario
  eu quero abrir um cofre travado
  para pegar pertences valiosos

  Scenario: digitar senha invalida
    Given que eu entrei com 1
    And entrei com 2
    And entrei com 3
    And entrei com 4
    And entrei com 5
    And entrei com 5
    When eu pressionei ok
    Then o display deve mostrar a mensagem para senha invalida "senha errada. Tente novamente"

  Scenario: digitar senha menor
    Given que eu entrei com 1
    And entrei com 2
    When eu pressionei ok
    Then o display deve mostrar a mensagem para senha menor do que seis caracteres "senha errada. Tente novamente"

  Scenario: digitar senha valida
    Given que eu entrei com 1
    And entrei com 2
    And entrei com 3
    And entrei com 4
    And entrei com 6
    And entrei com 6
    When eu pressionei ok
    Then o display deve mostrar a mensagem para senha valida "senha correta. Cofre aberto"