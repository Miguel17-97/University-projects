*** Settings ***
Library             Selenium2Library
Library             AutoRecorder
Library             String
Library             Dialogs

*** Variables ***
${URL}    https://demoqa.com/interaction 

*** Keywords ***
#Escoger Navegador
 #   ${Seleccion} =     Get Selection From User    Escoger Navegador    chrome    edge
  #  Set Global Variable    ${Navegador}    ${Seleccion}

Abrir Navegador y Esperar Logo
    #Open Browser    ${URL}   ${Navegador}
    Open Browser    ${URL}   chrome
    Wait Until Element Is Visible   xpath=//*[@id="app"]/header/a/img





