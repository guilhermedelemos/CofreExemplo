# language: en
Feature: Destravado
  Como um usuario
  eu quero fechar um cofre destravado
  para guardar pertences valiosos

  Scenario: limpar display
    Given que eu entrei com o numero 1
    And entrei com o numero 2
    When eu pressionei o botao clear
    Then o display deve mostrar a mensagem ""

  Scenario: porta aberta
    Given que eu entrei com o numero 1 com a porta aberta
    When a porta esta aberta
    Then o display deve mostrar a mensagem "Feche a porta antes de digitar a senha"

  Scenario: digitar um numero com a porta fechada
    Given que eu entrei com o numero 0 com a porta fechada
    When eu olhar para o display
    Then o display deve mostrar a mensagem "0"

  Scenario: gravar senha valida porta fechada destravada
    Given que eu entrei com o numero 6
    And entrei com o numero 5
    And entrei com o numero 4
    And entrei com o numero 3
    And entrei com o numero 2
    And entrei com o numero 1
    When eu pressionei o botao ok
    Then o display deve mostrar a mensagem "Senha salva. Cofre trancado"

  Scenario: digitar senha com menos de seis digitos
    Given que eu entrei com o numero 6 em um display vazio
    And entrei com o numero 5
    When eu pressionei o botao ok
    Then o display deve mostrar a mensagem "senha precisa de 6 digitos. Tente novamente"

    Scenario: digitar numeros porta fechada e depois abrir e digitar
    Given que eu entrei com o numero 6 e 7
    When eu olhar para o display
    Then o display deve mostrar a mensagem "7"
