*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}     https://dummyjson.com
${ENDPOINT}     /carts/add
&{HEADERS}      Content-Type=application/json

*** Test Cases ***
Adicionar Produto Com Sucesso
    [Documentation]    Teste para adicionar um produto ao carrinho com sucesso
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=1    quantity=2
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    userId=1    products=${PRODUCTS}

    ${RESPONSE}    POST On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Log    ${RESPONSE.json()}

Adicionar Carrinho Sem userId
    [Documentation]    Teste para verificar erro ao não enviar userId
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=1    quantity=2
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    products=${PRODUCTS}

    ${RESPONSE}    POST On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400

Adicionar Produto Com Quantidade Zero
    [Documentation]    Teste para validar que quantidade zero não é aceita
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=1    quantity=0
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    userId=1    products=${PRODUCTS}

    ${RESPONSE}    POST On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400

Adicionar Produto Inexistente
    [Documentation]    Teste para validar que um produto inválido não pode ser adicionado
    Create Session    minha_sessao    ${BASE_URL}

    ${PRODUCT}    Create Dictionary    id=99999    quantity=2
    ${PRODUCTS}    Create List    ${PRODUCT}
    ${BODY}    Create Dictionary    userId=1    products=${PRODUCTS}

    ${RESPONSE}    POST On Session    minha_sessao    ${ENDPOINT}    json=${BODY}    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400
