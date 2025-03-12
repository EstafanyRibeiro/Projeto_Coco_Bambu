***Settings***
Library         SeleniumLibrary
Library         FakerLibrary
Resource        variables/mapa.robot

*** Keywords ***
Dado que o site do Coco Bambu seja acessado
    Open Browser                    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Browser Implicit Wait       10

Quando o usuário selecionar a aba de Vouchers
    Wait Until Element Is Visible       ${VOUCHERS_LINK} 
    Click Element       ${VOUCHERS_LINK} 

E selecionar o Estado desejado
    Wait Until Element Is Visible       ${VOUCHERS_POPUP_ESTADO_DESEJADO}
    Click Element       ${VOUCHERS_POPUP_ESTADO_DESEJADO}
    Click Element       ${VOUCHERS_POPUP_ESTADO_DF}
    Click Element       ${VOUCHERS_POPUP_CONFIRMAR}

Então o usuário será direcionado para a tela de opções de Vouchers
    Wait Until Location Is    https://app-hom.cocobambu.com/vouchers    timeout=10s

E irá selecionar o voucher de Campanha de Testes para a região do Lago Sul
    Click Element       ${VOUCHER_CAMPANHA_DE_TESTES}
    Click Element       ${VOUCHER_CAMPANHA_TESTES}

Quando o usuário visualizar a página e ler as Regras
    Wait Until Element Is Visible       ${ABA_REGRAS}
    Click Element       ${ABA_REGRAS}

Então retornará para a aba de Detalhes e irá fazer o cadastro
    Wait Until Element Is Visible       ${ABA_DETALHES}
    Click Element       ${ABA_DETALHES}
    FOR    ${i}    IN RANGE    10
    ${status}    Run Keyword And Return Status    Element Should Be Visible    ${element_xpath}
    Exit For Loop If    ${status} == True
    Execute JavaScript    window.scrollBy(0, 300)
    Sleep    0.5s
    END

    Run Keyword If    '${status}' == 'False'    Capture Page Screenshot

    Wait Until Element Is Visible    ${BUTTON_LOGIN_CADASTRO}    timeout=10s
    Scroll Element Into View    ${BUTTON_LOGIN_CADASTRO}
    Click Element    ${BUTTON_LOGIN_CADASTRO}
    Wait Until Element Is Visible    ${CADASTRO_LINK}    timeout=10s
    Click Element       ${CADASTRO_LINK}
    Input Text          ${CAMPO_NOME_COMPLETO}      ${NOME}
    Input Text          ${CAMPO_EMAIL}              ${GERAR_EMAIL}
    Input Text          ${CAMPO_SENHA}              ${SENHA}
    Input Text          ${CAMPO_CONFIRMAR_SENHA}    ${SENHA}
    Click Element       ${CAMPO_SELECIONAR_ESTADO}
    Click Element       ${SPAN_DF}
    Click Element       ${CHECKBOX_NOTIFICACOES}
    Click Element       ${CHECKBOX_TERMOS}
    Click Element       ${ACEITAR_TERMOS}
    Click Element       ${BUTTON_FECHAR}

E irá válidar a autenticação
    Wait Until Element Is Visible       ${CAMPO1}
    Input Text          ${CAMPO1}       A
    Input Text          ${CAMPO2}       A
    Input Text          ${CAMPO3}       A
    Input Text          ${CAMPO4}       A
    Input Text          ${CAMPO5}       A
    Input Text          ${CAMPO6}       A

Então irá selecionar a forma de pagamento
    Click Element       ${BUTTON_SELECIONAR}
    Click Element       ${OPTION_GPay}

E irá preencher os dados complementares
    Click Element       ${BUTTON_SELECIONAR_NOME}
    Input Text          ${DADOS_NOME_CAMPO}         ${NOME}
    Input Text          ${CPF_CAMPO}                ${GERAR_CPF}
    Input Text          ${TELEFONE_CAMPO}           ${GERAR_TELEFONE}
    Click Element       ${BUTTON_SALVAR}

E selecionar a quantidade de Créditos
    Click Element       ${BUTTON_CREDITOS} 