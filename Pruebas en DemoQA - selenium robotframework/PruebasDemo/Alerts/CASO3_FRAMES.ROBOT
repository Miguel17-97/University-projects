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
G003 Frames
    ${ruta_carpeta}=    Set Variable    ./Reportes/Alerts/Caso3
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,200)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Take Screenshot    ${ruta_carpeta}/Caso3
    Click Element    xpath=//div[contains(text(),'Alerts, Frame & Windows')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Frames']
    Click Element    xpath=//span[text() = 'Frames']
    Take Screenshot    ${ruta_carpeta}/Caso3
    Sleep    2s
    Select Frame    id=frame1
    Sleep    2s
    ${texto}=    Get Text    id=sampleHeading
    Log To Console    Iframe1-${texto}   
    Unselect Frame 

    Select Frame    id=frame2
    Sleep    2s
    ${texto}=    Get Text    id=sampleHeading
    Log To Console    Iframe2-${texto}   
    Close Browser
