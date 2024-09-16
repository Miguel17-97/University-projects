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
G005 Progress Bar
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso5
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,350)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Execute JavaScript    window.scrollBy(0,150)
    Wait Until Element Is Visible    xpath=//span[text() = 'Progress Bar']
    Click Element    xpath=//span[text() = 'Progress Bar']
    Take Screenshot    ${ruta_carpeta}/Caso5
    Sleep    1s
    Click Element    id=startStopButton
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Wait Until Element Is Visible    xpath=//div[contains(text(),'100%')]    timeout=10s
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    id=resetButton
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Close Browser
