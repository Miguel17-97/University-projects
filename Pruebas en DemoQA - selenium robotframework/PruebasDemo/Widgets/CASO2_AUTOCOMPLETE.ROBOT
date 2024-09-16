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
G002 Auto complete
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso2
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,250)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Auto Complete']
    Click Element    xpath=//span[text() = 'Auto Complete']
    Take Screenshot    ${ruta_carpeta}/Caso2
    Input Text    id=autoCompleteMultipleInput    Gre
    Press Keys    id=autoCompleteMultipleInput    ENTER
    Input Text    id=autoCompleteMultipleInput    Re
    Press Keys    id=autoCompleteMultipleInput    ENTER
    Input Text    id=autoCompleteMultipleInput    Blu
    Press Keys    id=autoCompleteMultipleInput    ENTER
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Input Text    id=autoCompleteSingleInput    Blu
    Press Keys    id=autoCompleteSingleInput    ENTER
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Close Browser
