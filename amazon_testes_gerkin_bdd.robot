*** Settings ***
Documentation  Essa suíte testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
# Test Teardown  Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Essa suíte testa o site da Amazon.com.br
    [Tags]           menus  categorias

    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da pagina deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Avaliações dos clientes" deve ser exibido
    E o texto "Programas Prime" deve ser exibido


Caso de Teste 02 Pesquisa de um Produto
    [Documentation]     Esse teste verifica a busca de um produto
    [Tags]              busca_produtos lista_busca

    Dado que estou na home page da Amazon.com.br 
    Quando pesquisar pelo produto "Xbox Series S"
    E clico no botão de pesquisa
    Então um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    E Digito o nome de produto "Xbox Series S" no campo de pesquisa
    E clico no botão de pesquisa
    E verifico se o sistema exibiu a tela com o produto "Console Xbox Series S".
    E Clico no produto "Console Xbox Series S"
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho 
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E Digito o nome de produto "Xbox Series S" no campo de pesquisa
    E clico no botão de pesquisa
    E verifico se o sistema exibiu a tela com o produto "Console Xbox Series S".
    E clico no produto "Console Xbox Series S"
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    E abrirmos o carrinho
    E removemos o produto do carrinho
    Então o carrinho fica vazio

