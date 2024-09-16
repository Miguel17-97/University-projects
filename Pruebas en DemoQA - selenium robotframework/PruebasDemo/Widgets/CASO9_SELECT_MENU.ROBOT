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
G009 Select Menu
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso9
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,450)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso9
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Sleep    1s
    Execute JavaScript    window.scrollBy(0,250)
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[text() = 'Select Menu']
    Click Element    xpath=//span[text() = 'Select Menu']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Sleep    1s
    Click Element    id=withOptGroup
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Click Element    xpath=//div[text()='Group 1, option 2']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9

    Execute JavaScript    window.scrollBy(0,100)

    Click Element    id=selectOne
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Click Element    xpath=//div[text()='Mr.']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9

    Click Element    id=oldSelectMenu
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Click Element    xpath=//option[text()='Yellow']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9

    Execute JavaScript    window.scrollBy(0,150)

    Click Element    xpath=(//div[@class=' css-tlfecz-indicatorContainer'])[3]
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Click Element    xpath=//div[text()='Green']
    Click Element    xpath=//div[text()='Blue']
    Click Element    xpath=//div[text()='Black']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9

    Click Element    xpath=//option[text()='Volvo']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso9
    Close Browser
