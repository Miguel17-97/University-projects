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
G004 Nested Frames
    ${ruta_carpeta}=    Set Variable    ./Reportes/Alerts/Caso4
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,300)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Nested Frames']
    Click Element    xpath=//span[text() = 'Nested Frames']
    Take Screenshot    ${ruta_carpeta}/Caso4
    Sleep    2s
    Select Frame    id=frame1
    Sleep    2s
    ${textoPadre}=    Get Text    xpath=//body
    Log To Console    IframePadre-${textoPadre}   
    Sleep    1s
    Select Frame    xpath = //iframe
    Sleep    2s
    ${textoHijo}=    Get Text    xpath=//body
    Log To Console    IframeHijo-${textoHijo}  
    Close Browser
