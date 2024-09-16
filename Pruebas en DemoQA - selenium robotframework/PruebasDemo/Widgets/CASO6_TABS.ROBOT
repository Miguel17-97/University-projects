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
G006 Tabs
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso6
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,350)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Execute JavaScript    window.scrollBy(0,150)
    Wait Until Element Is Visible    xpath=//span[text() = 'Tabs']
    Click Element    xpath=//span[text() = 'Tabs']
    Take Screenshot    ${ruta_carpeta}/Caso6
    Sleep    1s
    Click Element    id=demo-tab-origin
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Sleep    1s
    Click Element    id=demo-tab-use
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=demo-tab-what
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Close Browser
