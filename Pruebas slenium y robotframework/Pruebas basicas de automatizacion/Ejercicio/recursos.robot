*** Settings ***
Documentation

Library    Selenium2Library
Library             Dialogs
Library             AutoRecorder
Library           Collections
Library   String


*** Variables ***
${Browser}   
${URL}      https://www.tiendasjumbo.co/
${URL1}        https://tiendasishop.com/co/    


*** Keywords ***

Seleccionar navegador
    ${Browser} =   Get Selection From User     Seleccionar navegador    chrome    edge  
    Set Global Variable    ${Browser}    ${Browser}
    Run Keyword If    '${Browser}'=='chrome'     Opcion Chrome    ELSE IF   '${Browser}'=='edge'    Opcion Edge

    
Opcion Chrome 
    Open Browser    ${URL}     ${Browser}
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/div[1]/div/div[2]/div/div[1]/div/div[1]/div/div/div/a/img
    
Opcion Edge
    Open Browser    ${URL}        ${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div/div[1]/div/div[2]/div/div[1]/div/div[1]/div/div/div/a/img

Captura de pantalla
    capture page screenshot    CapturaDePantalla.png

Pagina principal
    Click Element     Xpath=/html/body/div[2]/div/div[1]/div/div[2]/div/div[1]/div/div[1]/div/div/div/a/img
    Sleep     3s

Verificar usuario
    Click Element    Xpath=//*[@id="btnNoIdWpnPush"]
    Input Text        Xpath=/html/body/div[2]/div/div[1]/div/div[3]/div/div/div/div[2]/div/div/form/div[1]/label/div/input    sergio3@gmail.com
    Input Text    Xpath=/html/body/div[2]/div/div[1]/div/div[3]/div/div/div/div[2]/div/div/form/div[2]/div/label/div/input    Password1234
    Click Element    Xpath=/html/body/div[2]/div/div[1]/div/div[3]/div/div/div/div[2]/div/div/form/div[4]/div/button/div
    Sleep    2s

Busqueda
    Input Text        Xpath=//*[@id="downshift-1-input"]    Televisores
    Press Keys     Xpath=//*[@id="downshift-1-input"]    ENTER      
    Wait Until Element Is Visible    Xpath=/html/body/div[2]/div/div[1]/div/div[3]/div/div/section/div[2]/div/div[4]/div/div[2]/div/div/div[2]/div/div[3]/div/div/div[1]/div/div[2]    10s