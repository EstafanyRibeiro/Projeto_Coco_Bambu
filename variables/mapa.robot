#Autora: Estafany Ribeiro Augusto

***Settings***
Library         SeleniumLibrary
Library         FakerLibrary

***Variables***
#Acesso à página
${BROWSER}                      chrome
${URL}                          https://app-hom.cocobambu.com/delivery


#Página inicial
${VOUCHERS_LINK}                      //span[contains(text(), 'Vouchers')]
${VOUCHERS_POPUP_ESTADO_DESEJADO}     //div[@class='select-text select-placeholder']
${VOUCHERS_POPUP_ESTADO_DF}           //span[@class='action-sheet-button-inner sc-ion-action-sheet-ios']  
${VOUCHERS_POPUP_CONFIRMAR}           //xpath=(//button[normalize-space()='CONTINUAR'])[1]

#Vouchers
${VOUCHERS_URL}                       https://app-hom.cocobambu.com/vouchers
${VOUCHER_CAMPANHA_DE_TESTES}         XPath=//img[@title="Campanha para testes alterada [Não apague]"]    
${VOUCHER_CAMPANHA_TESTES}          //p[contains(@class, 'info-title') and contains(text(), 'Anúncio para testes [Não apague]')]

#Direcionamento para cadastro
${ABA_REGRAS}                      //ion-segment-button[contains(@class, 'ng-star-inserted') and contains(@class, 'md') and contains(@class, 'ion-activatable') and contains(@class, 'ion-focusable') and contains(@class, 'hydrated') and contains(@class, 'segment-button-after-checked') and div[contains(text(), 'REGRAS')]]
${ABA_DETALHES}                   //ion-segment-button[div[contains(@class, 'ion-segment-button-content') and contains(text(), 'DETALHES')]]
${BUTTON_LOGIN_CADASTRO}          //button[contains(text(), 'Você não está logado. Clique aqui e logue para poder realizar a compra de um voucher.')]


#Tela login/cadastro
${CADASTRO_LINK}                //span[@class='link']
${CAMPO_NOME_COMPLETO}          //input[@id='ion-input-4']
${NOME}                         Teste Teste
${GERAR_EMAIL}                  FakerLibrary.Generate Email
${CAMPO_EMAIL}                  //input[@id='ion-input-5']      
${CAMPO_SENHA}                  //input[@id='ion-input-6']
${SENHA}                        Aa012345@
${CAMPO_CONFIRMAR_SENHA}        //input[@id='ion-input-7']
${CAMPO_SELECIONAR_ESTADO}      //div[@class='select-text select-placeholder']
${SPAN_DF}                      //span[contains(text(),'Distrito Federal')]
${CHECKBOX_NOTIFICACOES}        //input[@id='ion-cb-0']
${CHECKBOX_TERMOS}              //input[@id='ion-cb-1']
${ACEITAR_TERMOS}               //button[@class='is-primary']
${BUTTON_FECHAR}                //button[@class='is-primary']

#Autenticação
${CAMPO1}                       //input[@id='otp_0_if9229kkibm8366jw3']     A
${CAMPO2}                       //input[@id='otp_1_if9229kkibm8366jw3']     A
${CAMPO3}                       //input[@id='otp_2_if9229kkibm8366jw3']     A
${CAMPO4}                       //input[@id='otp_3_if9229kkibm8366jw3']     A
${CAMPO5}                       //input[@id='otp_4_if9229kkibm8366jw3']     A
${CAMPO6}                       //input[@id='otp_5_if9229kkibm8366jw3']     A


#Formas de pogamento
${BUTTON_SELECIONAR}            //ion-button[@class='md button button-clear ion-activatable ion-focusable hydrated']
${OPTION_GPay}                   //span[contains(text(),'Google Pay')]


#Dados complementares
${BUTTON_SELECIONAR_NOME}       //ion-button[@class='ng-star-inserted md button button-clear ion-activatable ion-focusable hydrated']
${DADOS_NOME_CAMPO}             //input[@id='name']     Teste Teste
${GERAR_CPF}                    FakerLibrary.Generate CPF   
${CPF_CAMPO}                    //input[@id='id']      
${GERAR_TELEFONE}               FakerLibrary.Generate Phone Number 
${TELEFONE_CAMPO}               //input[@id='phone']        
${BUTTON_SALVAR}                //button[contains(text(),'SALVAR')]

#Créditos e conclusão
${BUTTON_CREDITOS}              //button[@name='voucher-plus-btn']
${CONFIRMAR}                    //div[@class='bag-button-items-quantity']