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
Caso05 Draggable
    ${ruta_carpeta}=    Set Variable    ./Reportes/resizable/Caso05
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,1000)

    Wait Until Element Is Visible    xpath=//div[contains(text(),'Interactions')]
    Take Screenshot    ${ruta_carpeta}/Caso5
    Click Element    xpath=//div[contains(text(),'Interactions')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Dragabble']
    Click Element    xpath=//span[text() = 'Dragabble']
    
    Take Screenshot    ${ruta_carpeta}/Caso5.55
    Sleep    1s
    Execute JavaScript    document.getElementById("dragBox").style.bottom = "50px";
    Execute JavaScript    document.getElementById("dragBox").style.left = "50px";
    Sleep    5s
    Click Element    //*[@id="dragBox"]
    Drag And Drop By Offset    //*[@id="dragBox"]   350   50
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]   -350   50
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]   40   500
    Sleep    3s

    Take Screenshot    ${ruta_carpeta}/Caso5.555
    Click Element    //*[@id="draggableExample-tab-axisRestriction"]
    Sleep    1s
    Drag And Drop By Offset    //*[@id="notAcceptable"]    350   20
    Sleep    1s
    Drag And Drop By Offset    //*[@id="acceptable"]    350   50
    Sleep    3s

    Take Screenshot    ${ruta_carpeta}/Caso5.5555
    Click Element    //*[@id="draggableExample-tab-containerRestriction"]
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    350   10
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    0   50
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    0   220
    Sleep    1s
    Drag And Drop By Offset    //*[@id="dragBox"]    0   80
    Sleep    1s

    Take Screenshot    ${ruta_carpeta}/Caso5.55555
    Click Element    //*[@id="draggableExample-tab-cursorStyle"]
    Sleep    1s
    Drag And Drop By Offset    //*[@id="revertable"]    350   20
    Sleep    1s
    Drag And Drop By Offset    //*[@id="notRevertable"]    350   20
    Sleep    3s
    Take Screenshot    ${ruta_carpeta}/Caso5.555555
    # Cerrar el navegador
    Close Browser