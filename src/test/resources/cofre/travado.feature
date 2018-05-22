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
    Then o display deve mostrar a mensagem de "senha errada. Tente novamente"

  Scenario: digitar senha menor
    Given que eu entrei com 1
    And entrei com 2
    When eu pressionei ok
    Then o display deve mostrar a mensagem de "senha errada. Tente novamente"

  Scenario: digitar senha valida
    Given que eu entrei com 1
    And entrei com 2
    And entrei com 3
    And entrei com 4
    And entrei com 5
    And entrei com 6
    When eu pressionei ok
    Then o display deve mostrar a mensagem de "senha correta. Cofre aberto"

  Scenario Outline: Tentar varias senhas
    Given que eu entrei com <n1>
    And entrei com <n2>
    And entrei com <n3>
    And entrei com <n4>
    And entrei com <n5>
    And entrei com <n6>
    When eu pressionei ok
    Then o display deve mostrar a mensagem de <saida>

    Examples: 
      | n1 | n2 | n3 | n4 | n5 | n6 | saida                                  |
     | 1    | 2    | 3    | 4   | 5    | 1    | "senha errada. Tente novamente"  |
      | 1    | 2    | 3    | 4   | 5    | 2    | "senha errada. Tente novamente"  |
      | 1    | 2    | 3    | 4   | 5    | 3    | "senha errada. Tente novamente"  |
      | 1    | 2    | 3    | 4   | 5    | 4    | "senha errada. Tente novamente"  |
      | 1    | 2    | 3    | 4   | 5    | 5    | "senha errada. Tente novamente"  |
      | 1    | 2    | 3    | 4   | 5    | 6    | "senha correta. Cofre aberto"  |
