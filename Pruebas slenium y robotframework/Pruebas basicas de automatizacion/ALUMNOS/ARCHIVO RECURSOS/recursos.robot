*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion
Library             Selenium2Library

*** Variables ***
${palabraABuscar}   CASOS PRUEBA
${Navegador}    chrome
${URL}      https://www.google.com/

*** Keywords ***
Abrir Navegador y Esperar Logo
    Open Browser    ${URL}     ${Navegador}
    Wait Until Element Is Visible   xpath=//*[@id="hplogo"]

