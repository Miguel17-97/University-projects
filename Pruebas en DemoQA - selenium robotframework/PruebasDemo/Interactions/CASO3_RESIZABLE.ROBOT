*** Settings ***
Documentation       Prueba automatizada para resizable
...                 Esta es mi primera automatizacion

Library             SeleniumLibrary
Library             OperatingSystem
Library             Screenshot


*** Variables ***
${URL}          https://demoqa.com/login
${Navegador}    chrome


*** Test Cases ***
Caso03 Resizable
    ${ruta_carpeta}=    Set Variable    ./Reportes/resizable/Caso03
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,500)

    Wait Until Element Is Visible    xpath=//div[contains(text(),'Interactions')]
    Take Screenshot    ${ruta_carpeta}/Caso3
    Click Element    xpath=//div[contains(text(),'Interactions')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Resizable']
    Click Element    xpath=//span[text() = 'Resizable']
    
    Take Screenshot    ${ruta_carpeta}/Caso3.33
    Sleep    2s
    Drag And Drop By Offset    //*[@id="resizableBoxWithRestriction"]/span    300   0 
    Sleep    2s
    Drag And Drop By Offset    //*[@id="resizableBoxWithRestriction"]/span    0    100
    Sleep    2s
    Drag And Drop By Offset    //*[@id="resizableBoxWithRestriction"]/span    -300    -100
    Take Screenshot    ${ruta_carpeta}/Caso3.33
    Sleep                2s
    Drag And Drop By Offset    //*[@id="resizable"]/span    300   0 
    Sleep    2s
    Drag And Drop By Offset    //*[@id="resizable"]/span    0    100
    Sleep    2s
    Drag And Drop By Offset    //*[@id="resizable"]/span    -300    -100
    Sleep    2s
    # Cerrar el navegador
    Close Browser