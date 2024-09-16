*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion

Library             Selenium2Library
Library             Screenshot
Library             OperatingSystem


*** Variables ***
${URL}          https://demoqa.com/interaction
${Navegador}    chrome


*** Test Cases ***
G001 Browser windows
    ${ruta_carpeta}=    Set Variable    ./Reportes/Alerts/Caso1
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,200)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Browser Windows']
    Click Element    xpath=//span[text() = 'Browser Windows']
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    id = tabButton
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Switch Window
    Click Element    id = windowButton
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Switch Window
    Click Element    id = messageWindowButton
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Switch Window
    Close Browser
