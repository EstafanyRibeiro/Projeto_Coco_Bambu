*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}     https://dummyjson.com
&{HEADERS}      Content-Type=application/json

*** Test Cases ***
Remover Carrinho Com Sucesso
    [Documentation]    Teste para remover um carrinho existente com sucesso
    Create Session    minha_sessao    ${BASE_URL}

    ${RESPONSE}    DELETE On Session    minha_sessao    /carts/1    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Log    ${RESPONSE.json()}

Remover Carrinho Inexistente
    [Documentation]    Teste para verificar erro ao remover um carrinho inexistente
    Create Session    minha_sessao    ${BASE_URL}

    ${RESPONSE}    DELETE On Session    minha_sessao    /carts/99999    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    404

Remover Carrinho Sem ID
    [Documentation]    Teste para verificar erro ao tentar remover um carrinho sem fornecer ID
    Create Session    minha_sessao    ${BASE_URL}

    ${RESPONSE}    DELETE On Session    minha_sessao    /carts/    headers=&{HEADERS}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    400
