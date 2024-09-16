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
G003 Radio Button
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso3
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso3
    Click Element    xpath=//div[contains(text(),'Elements')]
    Execute JavaScript    window.scrollBy(0,200)
    Sleep    2s
    Click Element    xpath=//span[text() = 'Radio Button']
    Take Screenshot    ${ruta_carpeta}/Caso3
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Radio Button')]
    Click Element    xpath = //label[@for= 'yesRadio']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso3
    Click Element    xpath = //label[@for= 'impressiveRadio']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso3
    Close Browser
