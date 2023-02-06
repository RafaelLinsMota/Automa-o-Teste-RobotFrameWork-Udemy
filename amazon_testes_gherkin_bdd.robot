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


    