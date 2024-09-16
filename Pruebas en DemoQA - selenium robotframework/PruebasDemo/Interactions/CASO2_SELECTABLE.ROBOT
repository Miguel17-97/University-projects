*** Settings ***
Documentation       Prueba automatizada para selectable
...                 Esta es mi primera automatizacion

Library             SeleniumLibrary
Library             OperatingSystem
Library             Screenshot


*** Variables ***
${URL}          https://demoqa.com/login
${Navegador}    chrome


*** Test Cases ***
G02 Selectable
    ${ruta_carpeta}=    Set Variable    ./Reportes/selectable/Caso2
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,500)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Interactions')]
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath=//div[contains(text(),'Interactions')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Selectable']
    Click Element    xpath=//span[text() = 'Selectable']
    Sleep    2s
    Click Element    //*[@id="verticalListContainer"]/li[1]
    Sleep    1s
    Click Element    //*[@id="verticalListContainer"]/li[2]
    Sleep    1s
    Click Element    //*[@id="verticalListContainer"]/li[3]
    Sleep    1s
    Click Element    //*[@id="verticalListContainer"]/li[4]
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2
    Click Element    xpath=//*[@id="demo-tab-grid"]
    Click Element    //*[@id="row1"]/li[1]
    Sleep    1s
    Click Element    //*[@id="row1"]/li[2]
    Sleep    1s
    Click Element    //*[@id="row1"]/li[3]
    Sleep    1s
    Click Element    //*[@id="row2"]/li[1]
    Sleep    1s
    Click Element    //*[@id="row2"]/li[2]
    Sleep    1s
    Click Element    //*[@id="row2"]/li[3]
    Sleep    1s
    Click Element    //*[@id="row3"]/li[1]
    Sleep    1s
    Click Element    //*[@id="row3"]/li[2]
    Sleep    1s
    Click Element    //*[@id="row3"]/li[3]
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso2

    Close Browser