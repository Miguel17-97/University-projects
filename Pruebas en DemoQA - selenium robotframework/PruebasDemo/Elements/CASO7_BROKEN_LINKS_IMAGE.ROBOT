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
G007 Broken Links - Images
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso7
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso7
    Click Element    xpath=//div[contains(text(),'Elements')]
    Execute JavaScript    window.scrollBy(0,300)
    Wait Until Element Is Visible    xpath=//span[text() = 'Broken Links - Images']
    Click Element    xpath=//span[text() = 'Broken Links - Images']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Execute JavaScript    window.scrollBy(0,150)
    Click Element    xpath=//a[contains(text(),'Click Here for Valid Link')]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Go Back
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Broken Links - Images')]
    Execute JavaScript    window.scrollBy(0,220)
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Click Element    xpath=//a[contains(text(),'Click Here for Broken Link')]
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso7
    Go Back
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Broken Links - Images')]
    Sleep    2s
    Go Back
    Close Browser
