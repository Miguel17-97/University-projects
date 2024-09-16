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
Caso04 Droppable
    ${ruta_carpeta}=    Set Variable    ./Reportes/resizable/Caso04
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,500)
    
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Interactions')]
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    xpath=//div[contains(text(),'Interactions')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Droppable']
    Click Element    xpath=//span[text() = 'Droppable']
    
    Take Screenshot    ${ruta_carpeta}/Caso4.44
    Sleep    1s
    Drag And Drop By Offset    //*[@id="draggable"]    350   40
    Sleep    3s

    Take Screenshot    ${ruta_carpeta}/Caso4.444
    Click Element    //*[@id="droppableExample-tab-accept"]
    Sleep    1s
    Drag And Drop By Offset    //*[@id="notAcceptable"]    350   20
    Sleep    1s
    Drag And Drop By Offset    //*[@id="acceptable"]    350   50
    Sleep    3s

    Take Screenshot    ${ruta_carpeta}/Caso4.4444
    Click Element    //*[@id="droppableExample-tab-preventPropogation"]
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    350   10
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    0   50
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    0   220
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    0   80
    Sleep    1s

    Take Screenshot    ${ruta_carpeta}/Caso4.44444
    Click Element    //*[@id="droppableExample-tab-revertable"]
    Sleep    1s
    Drag And Drop By Offset    //*[@id="revertable"]    350   20
    Sleep    1s
    Drag And Drop By Offset    //*[@id="notRevertable"]    350   20
    Sleep    3s
    Take Screenshot    ${ruta_carpeta}/Caso4.444444
    # Cerrar el navegador
    Close Browser