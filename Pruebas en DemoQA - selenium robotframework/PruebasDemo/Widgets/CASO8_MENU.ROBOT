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
G008 Menu
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso8
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,550)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso8
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Execute JavaScript    window.scrollBy(0,200)
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[text() = 'Menu']
    Click Element    xpath=//span[text() = 'Menu']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8
    Sleep    1s
    Mouse Over    xpath=//a[text()='Main Item 1']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=//a[text()='Main Item 2']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=(//a[text()='Sub Item'])[1]
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=(//a[text()='Sub Item'])[2]
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=(//a[text()='SUB SUB LIST »'])
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=(//a[text()='Sub Sub Item 1'])
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=(//a[text()='Sub Sub Item 2'])
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    Mouse Over    xpath=(//a[text()='Main Item 3'])
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8
    Close Browser
