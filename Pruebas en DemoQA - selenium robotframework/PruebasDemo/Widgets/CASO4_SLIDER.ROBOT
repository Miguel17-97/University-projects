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
G004 Slider
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso4
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,350)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Slider']
    Click Element    xpath=//span[text() = 'Slider']
    Take Screenshot    ${ruta_carpeta}/Caso4
    Sleep    2s
    Drag And Drop By Offset    xpath=//input[@class = 'range-slider range-slider--primary']    0    150
    Take Screenshot    ${ruta_carpeta}/Caso4
    Close Browser
