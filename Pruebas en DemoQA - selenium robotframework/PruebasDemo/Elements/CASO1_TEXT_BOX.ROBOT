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
G001 Llenado y envío de Formulario
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso1
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//div[contains(text(),'Elements')]
    Click Element    xpath=//span[text() = 'Text Box']
    Take Screenshot    ${ruta_carpeta}/Caso1
    Input Text    id=userName    Nombre Prueba
    Input Text    id=userEmail    email@Prueba.com
    Input Text    id=currentAddress    Politécnico Jaime Isaza Cadavid
    Input Text    id=permanentAddress    Antioquia
    Execute JavaScript    window.scrollBy(0,300)
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//button[text()='Submit']
    Execute JavaScript    window.scrollBy(0,300)
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1
    
    Close Browser
