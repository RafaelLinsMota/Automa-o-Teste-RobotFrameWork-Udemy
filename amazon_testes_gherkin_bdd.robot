*** Settings ***
Documentation    Essa suite teste o site amazon.com.br utilizando Gherkin
Resource    amazon_resources.robot
Test Setup    abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletronicos"

    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E a categoria "Computadores e Informática" deve ser exibida na página"

Caso de Teste 02 - Pesquisa de um Produto
       [Documentation]  Esse teste verifica a busca de um produto
       [Tags]           busca_produtos  lista_busca
       Dado que estou na home page da Amazon.com.br
       Quando digito o nome de produto "Xbox Series S" no campo de pesquisa
       E clico no botão de pesquisa
       Então verifica o resultado da pesquisa se está listando o "Console Xbox Series S"
    
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando digito o nome de produto "Xbox Series S" no campo de pesquisa
    E clico no botão de pesquisa
    Então verifica o resultado da pesquisa se está listando o "Console Xbox Series S"
    E Adicionar o produto "Console Xbox Series S" no carrinho
    E Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando digito o nome de produto "Xbox Series S" no campo de pesquisa
    E clico no botão de pesquisa
    Então verifica o resultado da pesquisa se está listando o "Console Xbox Series S"
    E Adicionar o produto "Console Xbox Series S" no carrinho
    E Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Quando Remover o produto "Console Xbox Series S" do carrinho
    Então Verificar se o carrinho fica vazio