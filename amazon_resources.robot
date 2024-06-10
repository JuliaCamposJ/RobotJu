*** Settings ***
Library           SeleniumLibrary 


*** Variables ***
${URL}        https://www.amazon.com.br/
${MENU_ELETRONICOS}        //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}        //h1[contains(.,'Eletrônicos e Tecnologia')]
${PESQUISA}        //input[contains(@type,'text')]
${LUPA_PESQUISA}    //input[contains(@type,'submit')]

*** Keywords ***

Abrir o navegador 
        Open Browser   browser=chrome
        Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS} 

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece o texto "${PAGE_MENU}"
    Element Should Be Visible    locator=//span[@class='a-size-base a-color-base a-text-bold'][contains(.,'${PAGE_MENU}')]

Digitar o nome de produto "${PRODUTO_NAME}" no campo de pesquisa
    Input Text    locator=${PESQUISA}    text=${PRODUTO_NAME}

Clicar no botão de pesquisa
    Click Element    locator=${LUPA_PESQUISA}

Verificar se o sistema exibiu a tela com o produto "${PRODUTO_NAME}".
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO_NAME}')]

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da pagina deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Avaliações dos clientes" deve ser exibido
    Verificar se aparece o texto "Avaliações dos clientes"

E o texto "Programas Prime" deve ser exibido
    Verificar se aparece o texto "Programas Prime"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

E clico no botão de pesquisa
    Clicar no botão de pesquisa
 
Então um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar se o sistema exibiu a tela com o produto "Console Xbox Series S".

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]

Clicar no produto "Console Xbox Series S"
    Click Element   locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Element Should Be Visible    locator=//h1[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Selecionar botão "Ir para o carrinho"
    Wait Until Element Is Visible    locator=//a[contains(.,'Ir para o carrinho')]
    Click Element   Locator=//a[contains(.,'Ir para o carrinho')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=(//input[contains(@value,'Excluir')])[1]

Verificar se o carrinho fica vazio
    Element Should Not Be Visible    locator=(//input[contains(@value,'Excluir')])[1]

Verificar se o sistema exibiu a mensagem "${SEM_RESULTADOS}"
    Wait Until Element Is Visible    locator=//div[@class='a-row a-size-base a-color-base'][contains(.,'${SEM_RESULTADOS}')]

E Digito o nome de produto "Xbox Series S" no campo de pesquisa
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa

E verifico se o sistema exibiu a tela com o produto "Console Xbox Series S".
    Verificar se o sistema exibiu a tela com o produto "Console Xbox Series S".

E Clico no produto "Console Xbox Series S"
    Clicar no produto "Console Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E abrirmos o carrinho
    Selecionar botão "Ir para o carrinho"

E removemos o produto do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho fica vazio
    Verificar se o carrinho fica vazio
