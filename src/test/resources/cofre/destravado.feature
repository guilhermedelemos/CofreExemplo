# language: en
Feature: Destravado
  Como um usuario
  eu quero fechar um cofre destravado
  para guardar pertences valiosos

  Scenario: limpar display
    Given que eu entrei com o numero 1
    And entrei com o numero 2
    When eu pressionei o botao ok
    Then o display deve mostrar uma mensagem vazia ""

  Scenario: porta nao fechada
    Given que eu entrei com o numero 1
    When a porta esta aberta
    Then o display deve mostrar a mensagem de porta aberta "Feche a porta antes de digitar a senha"

  Scenario: digitar um numero com a porta fechada
    Given que eu entrei com o numero 0
    When a porta esta fechada
    Then o display deve mostrar o numero "0"

  Scenario: gravar senha valida porta fechada destravada
    Given que eu entrei com o numero 6
    And entrei com o numero 5
    And entrei com o numero 4
    And entrei com o numero 3
    And entrei com o numero 2
    And entrei com o numero 1
    When eu pressionei o botao ok
    Then o display deve mostrar a mensagem de sucesso "Senha salva. Cofre trancado"

  Scenario: digitar senha com menos de seis digitos
    Given que eu entrei com o numero 6
    And entrei com o numero 5
    When eu pressionei o botao ok
    Then o display deve mostrar a mensagem de erro de senha pequena "senha precisa de 6 digitos. Tente novamente"

  Scenario: digitar senha errada
    Given que eu entrei com o numero 6
    And entrei com o numero 5
    And entrei com o numero 4
    And entrei com o numero 3
    And entrei com o numero 2
    And entrei com o numero 2
    When eu pressionei o botao ok
    Then o display deve mostrar a mensagem de erro de senha pequena "senha errada. Tente novamente"

  Scenario: digitar senha errada
    Given que eu entrei com o numero 6
    And entrei com o numero 5
    And entrei com o numero 4
    And entrei com o numero 3
    And entrei com o numero 2
    And entrei com o numero 2
    When eu pressionei o botao ok
    Then o display deve mostrar a mensagem de erro de senha pequena "senha errada. Tente novamente"

  Scenario: digitar numeros porta fechada e depois abrir e digitar
    Given que eu entrei com o numero 654321 e 65
    When eu pressionei o botao ok
    Then o display deve mostrar os numeros digitados "65"
