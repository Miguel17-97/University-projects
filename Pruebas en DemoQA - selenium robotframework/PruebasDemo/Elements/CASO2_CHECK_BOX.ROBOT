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
G002 Checkbox
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso2
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath=//div[contains(text(),'Elements')]
    Click Element    xpath=//span[text() = 'Check Box']
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath=//button[@aria-label = 'Expand all']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath= (//span[@class = 'rct-checkbox'])[2]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Execute JavaScript    window.scrollBy(0,200)
    Click Element    xpath= (//span[@class = 'rct-checkbox'])[5]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath= (//span[@class = 'rct-checkbox'])[15]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Execute JavaScript    window.scrollBy(0,-500)
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath=//button[@aria-label = 'Collapse all']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Close Browser
