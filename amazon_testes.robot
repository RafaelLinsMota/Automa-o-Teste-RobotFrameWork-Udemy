*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletronicos"
#robot -t "Caso de Teste 01 - Acesso ao menu "Eletronicos"" amazon_testes.robot
        [Documentation]  Esse teste verifica o menu eletronico do site da amazon.com.br
        ...              e verifica a categoria Computadores e Informática
        [Tags]           menus  categorias
        Acessar a home page do site Amazon.com.br
        Entrar no menu "Eletrônicos"
        Verificar se aparece a frase "Eletrônicos e Tecnologia"
        Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
        Verificar se aparece a categoria "Computadores e Informática"
        Verificar se aparece a categoria "Celulares e Comunicação"
        Verificar se aparece a categoria "TV e Cinema em Casa"
        Verificar se aparece a categoria "Áudio e Som"
        Verificar se aparece a categoria "Tablets"
        Verificar se aparece a categoria "Acessórios Eletrônicos"
        Verificar se aparece a categoria "Smartwatches"
        Verificar se aparece a categoria "Câmeras e Foto"
        Verificar se aparece a categoria "Alexa e Casa Inteligente"
        Verificar se aparece a categoria "Eletrônicos para Escritório"
        Verificar se aparece a categoria "PC Gamer"
        Verificar se aparece a categoria "Instrumentos Musicais"
        

Caso de Teste 02 - Pesquisa de um Produto
#robot -t "Caso de Teste 02 - Pesquisa de um Produto" amazon_testes.robot
       [Documentation]  Esse teste verifica a busca de um produto
       [Tags]           busca_produtos  lista_busca
       Acessar a home page do site Amazon.com.br
       Digitar o nome de produto "Xbox Series S" no campo de pesquisa
       Clicar no botão de pesquisa
       Verificar o resultado da pesquisa se está listando o "Console Xbox Series S"



