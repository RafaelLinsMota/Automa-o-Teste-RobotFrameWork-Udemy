*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              http://www.amazon.com.br
${LOGO}                             nav-logo-sprites
${ELETRONICO}                       //a[contains(@href,'electronics')]
${CONSOLE}                          //img[@alt='Console Xbox Series S']

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To           url=${URL}
    Wait Until Element Is Visible    locator=${LOGO}
    Sleep    3s

Entrar no menu "Eletrônicos"
    Double Click Element    locator=${ELETRONICO} 
    Sleep    3s

Verificar se aparece a frase "${TEXTO_ELETRONICO}"
    Wait Until Page Contains    text=${TEXTO_ELETRONICO}

Verificar se o título da página fica "${HEADER_ELETRONICO}"
    Title Should Be    ${HEADER_ELETRONICO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}
    
Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]

#    GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E a categoria "Computadores e Informática" deve ser exibida na página"
    Verificar se aparece a categoria "Computadores e Informática"
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Image    locator=${CONSOLE}
    Click Button    locator=add-to-cart-button
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Sleep    3s
    Click Element    locator=//input[contains(@value,'Excluir')]
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=sc-subtotal-label-activecart
    Wait Until Page Contains    text=0 itens
Quando digito o nome de produto "${PRODUTO}" no campo de pesquisa
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
E clico no botão de pesquisa
    Clicar no botão de pesquisa
Então verifica o resultado da pesquisa se está listando o "${PRODUTO}"
    Verificar o resultado da pesquisa se está listando o "${PRODUTO}"
E Adicionar o produto "Console Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho
E Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando Remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
Então Verificar se o carrinho fica vazio
    Verificar se o carrinho fica vazio