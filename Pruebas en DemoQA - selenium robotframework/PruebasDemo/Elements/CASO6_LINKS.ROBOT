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
G006 Links
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso6
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    xpath=//div[contains(text(),'Elements')]
    Execute JavaScript    window.scrollBy(0,300)
    Wait Until Element Is Visible    xpath=//span[text() = 'Links']
    Click Element    xpath=//span[text() = 'Links']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=simpleLink
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Switch Window
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=dynamicLink
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Switch Window
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Execute JavaScript    window.scrollBy(0,200)
    Click Element    id=created
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=no-content
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=moved
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=bad-request
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=unauthorized
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=forbidden
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Click Element    id=invalid-url
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso6
    Close Browser
