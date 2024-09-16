*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion
...                   Es recomendable actualizar la version del chromedriver para su correcto funcionamiento
...                  

Library             Selenium2Library
Library             Screenshot
Library             OperatingSystem


*** Variables ***
${URL}          https://demoqa.com/login
${Navegador}    chrome


*** Test Cases ***
G001 Sortable
    ${ruta_carpeta}=    Set Variable    ./Reportes/interactions/Caso1
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,500)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Interactions')]
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//div[contains(text(),'Interactions')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Sortable']
    Click Element    xpath=//span[text() = 'Sortable']
    Take Screenshot    ${ruta_carpeta}/Caso1
    Sleep    2s
    Execute JavaScript    window.scrollBy(0,150)
    Drag And Drop    xpath=(//div[text()='One'])[1]    xpath=(//div[text()='Four'])[1]
    Drag And Drop    xpath=(//div[text()='Two'])[1]    xpath=(//div[text()='Six'])[1]
    Drag And Drop    xpath=(//div[text()='Six'])[1]    xpath=(//div[text()='Five'])[1]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1

    Drag And Drop    xpath=(//div[text()='One'])[1]    xpath=(//div[text()='Three'])[1]
    Drag And Drop    xpath=(//div[text()='Two'])[1]    xpath=(//div[text()='Three'])[1]
    Drag And Drop    xpath=(//div[text()='Five'])[1]    xpath=(//div[text()='Six'])[1]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1

    Click Element    id=demo-tab-grid
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso1

    Drag And Drop    xpath=(//div[text()='One'])[2]    xpath=(//div[text()='Four'])[2]
    Drag And Drop    xpath=(//div[text()='Two'])[2]    xpath=(//div[text()='Six'])[2]
    Drag And Drop    xpath=(//div[text()='Six'])[2]    xpath=(//div[text()='Five'])[2]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1

    Drag And Drop    xpath=(//div[text()='One'])[2]    xpath=(//div[text()='Three'])[2]
    Drag And Drop    xpath=(//div[text()='Two'])[2]    xpath=(//div[text()='Three'])[2]
    Drag And Drop    xpath=(//div[text()='Five'])[2]    xpath=(//div[text()='Six'])[2]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1

    Close Browser
