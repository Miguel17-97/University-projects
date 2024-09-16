*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}      chrome
${homepage}     https://www.homecenter.com.co/
${Seleccion}    Other

*** Keywords ***
Select Women Option
    Click Element   xpath=//*[@id="__next"]/nav/div[2]/div/div[3]/ul/li[2]/a/span[2]/svg
    Title Should Be     Carro de compras vacío
	
Select Dresses Option
    Click Element   xpath=//*[@id="block_top_menu"]/ul/li[2]/a
    Title Should Be     Dresses - My Store

*** Test Cases ***
001 Caso con Condicionales
    Open Browser    ${homepage}     ${browser}
    Wait Until Element Is Visible   //*[@id="header-logo-BrandLogo-303d9d36-fbe7-44b4-9313-c4d1c3f6122f"]/a/picture/img
    Run Keyword If       '${Seleccion}'=='Women'     Select Women Option
	Sleep  5s
