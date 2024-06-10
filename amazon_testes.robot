*** Settings ***
Documentation  Essa suíte testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
# Test Teardown  Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos da Amazon.com.br 
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece o texto "Avaliações dos clientes"
    Verificar se aparece o texto "Programas Prime"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o sistema exibiu a tela com o produto "Console Xbox Series S".

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o sistema exibiu a tela com o produto "Console Xbox Series S".
    Clicar no produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o sistema exibiu a tela com o produto "Console Xbox Series S".
    Clicar no produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Selecionar botão "Ir para o carrinho"
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio
    
Caso de Teste 05 - Fazer uma pesquisa inválida (sem retorno)
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             Pesquisa_inválida
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "aaafgjhbbgyvgaaa" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o sistema exibiu a mensagem "Tente verificar a ortografia ou usar termos mais genéricos"
 
