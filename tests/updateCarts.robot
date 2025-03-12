*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}     https://dummyjson.com
${ENDPOINT}     /carts/1
&{HEADERS}      Content-Type=application/json

*** Test Cases ***
Atualizar Carrinho Com Sucesso
    [Documentation]    Teste para atualizar um carrinho existente com sucesso
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=1    quantity=5
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    products=${PRODUCTS}

    ${RESPONSE}    PUT On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Log    ${RESPONSE.json()}

Atualizar Carrinho Inexistente
    [Documentation]    Teste para verificar erro ao atualizar um carrinho inexistente
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=1    quantity=5
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    products=${PRODUCTS}

    ${RESPONSE}    PUT On Session    minha_sessao    /carts/99999    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    404

Atualizar Carrinho Sem Produtos
    [Documentation]    Teste para verificar erro ao atualizar um carrinho sem produtos
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCTS}    Create List
    ${BODY}    Create Dictionary    products=${PRODUCTS}

    ${RESPONSE}    PUT On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400

Atualizar Carrinho Com Produto Inexistente
    [Documentation]    Teste para verificar erro ao atualizar um carrinho com um produto inexistente
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=99999    quantity=2
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    products=${PRODUCTS}

    ${RESPONSE}    PUT On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400

Atualizar Carrinho Com Quantidade Inválida
    [Documentation]    Teste para verificar erro ao atualizar um carrinho com quantidade zero ou negativa
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT_1}    Create Dictionary    id=1    quantity=0
    ${PRODUCT_2}    Create Dictionary    id=1    quantity=-1
    ${PRODUCTS}    Create List    ${PRODUCT_1}    ${PRODUCT_2}
    ${BODY}    Create Dictionary    products=${PRODUCTS}

    ${RESPONSE}    PUT On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400
