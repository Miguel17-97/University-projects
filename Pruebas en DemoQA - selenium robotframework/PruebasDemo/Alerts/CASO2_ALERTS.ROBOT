*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion

Library             Selenium2Library
Library             Screenshot
Library             OperatingSystem
Library             Process

*** Variables ***
${URL}          https://demoqa.com/interaction
${Navegador}    chrome

*** Test Cases ***
G002 Alerts
    ${ruta_carpeta}=    Set Variable    ./Reportes/Alerts/Caso2
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,200)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Alerts']
    Click Element    xpath=//span[text() = 'Alerts']
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    id=alertButton
    Sleep    2s
    Wait Until Keyword Succeeds    30x    1s    Handle Alert    accept
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2

    Click Element    id=timerAlertButton
    Sleep    6s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Handle Alert    accept
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2

    Click Element    id=confirmButton
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Handle Alert    accept
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2

    Click Element    id=confirmButton
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Handle Alert    dismiss
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2

    Click Element    id=promtButton
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Input Text Into Alert    Prueba
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2

    Close Browser