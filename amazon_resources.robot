*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                              http://www.amazon.com.br
${LOGO}                             nav-logo-sprites
${ELETRONICO}                       //a[contains(@href,'electronics')]

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