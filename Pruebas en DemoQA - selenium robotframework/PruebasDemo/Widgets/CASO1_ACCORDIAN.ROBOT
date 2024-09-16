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
G001 Accordian
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso1
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,200)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Accordian']
    Click Element    xpath=//span[text() = 'Accordian']
    Take Screenshot    ${ruta_carpeta}/Caso1
    Wait Until Element Is Visible    id = section1Heading
    Sleep     1s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    id = section1Heading
    Sleep    1s
    Click Element    id = section2Heading
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    id = section2Heading
    Sleep    1s
    Click Element    id = section3Heading
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    id = section3Heading

    Close Browser
