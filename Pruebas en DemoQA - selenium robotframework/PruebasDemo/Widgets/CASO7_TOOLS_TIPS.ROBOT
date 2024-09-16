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
G007 Tools Tips
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso7
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,500)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso7
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Execute JavaScript    window.scrollBy(0,150)
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[text() = 'Tool Tips']
    Click Element    xpath=//span[text() = 'Tool Tips']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Sleep    1s
    Mouse Over    id=toolTipButton
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Mouse Over    id=toolTipTextField
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Mouse Over    xpath=//a[text()='Contrary']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Execute JavaScript    window.scrollBy(0,150)
    Mouse Over    xpath=//a[text()='1.10.32']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Close Browser
