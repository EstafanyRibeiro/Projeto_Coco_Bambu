*** Settings ***
Library  SeleniumLibrary
Library  FakerLibrary
Resource  keywords/keywords.robot
Resource  variables/mapa.robot



*** Test Cases ***
Compra de voucher
    Dado que o site do Coco Bambu seja acessado
    Quando o usuário selecionar a aba de Vouchers
    # E selecionar o Estado desejado

    Então o usuário será direcionado para a tela de opções de Vouchers
    E irá selecionar o voucher de Campanha de Testes para a região do Lago Sul

    Quando o usuário visualizar a página e ler as Regras
    Então retornará para a aba de Detalhes e irá fazer o cadastro
    E irá válidar a autenticação

    Então irá selecionar a forma de pagamento
    E irá preencher os dados complementares
    E selecionar a quantidade de Créditos