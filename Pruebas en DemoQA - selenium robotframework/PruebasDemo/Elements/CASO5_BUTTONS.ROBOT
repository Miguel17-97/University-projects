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
G005 Buttons
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso5
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    xpath=//div[contains(text(),'Elements')]
    Execute JavaScript    window.scrollBy(0,200)
    Click Element    xpath=//span[text() = 'Buttons']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Double Click Element    id=doubleClickBtn
    Open Context Menu    id=rightClickBtn
    Click Element    xpath=//button[(text()='Click Me')]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso5
    Close Browser
