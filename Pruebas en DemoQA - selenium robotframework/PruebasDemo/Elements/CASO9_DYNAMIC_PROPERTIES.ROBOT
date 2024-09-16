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
G009 Dynamic Properties
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso9
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso9
    Click Element    xpath=//div[contains(text(),'Elements')]
    Execute JavaScript    window.scrollBy(0,400)
    Wait Until Element Is Visible    xpath=//span[text() = 'Dynamic Properties']
    Click Element    xpath=//span[text() = 'Dynamic Properties']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Wait Until Element Is Enabled   id= enableAfter
    Click Element     id= enableAfter
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Close Browser
