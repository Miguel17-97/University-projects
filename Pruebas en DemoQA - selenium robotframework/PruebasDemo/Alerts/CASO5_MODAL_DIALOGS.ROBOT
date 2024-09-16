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
G005 Modal Dialogs
    ${ruta_carpeta}=    Set Variable    ./Reportes/Alerts/Caso5
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,350)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Modal Dialogs']
    Click Element    xpath=//span[text() = 'Modal Dialogs']
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    id=showSmallModal
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    id=closeSmallModal
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
      Click Element    id=showLargeModal
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    id=closeLargeModal
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Close Browser
