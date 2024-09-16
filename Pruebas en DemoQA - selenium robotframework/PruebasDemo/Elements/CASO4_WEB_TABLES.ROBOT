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
G004 Web Tables
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso4
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    xpath=//div[contains(text(),'Elements')]
    Execute JavaScript    window.scrollBy(0,200)
    Click Element    xpath=//span[text() = 'Web Tables']
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    id=addNewRecordButton
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Input Text    id=firstName    Prueba
    Input Text    id=lastName    Prueba
    Input Text    id=userEmail    prueba@gmail.com
    Input Text    id=age    20
    Input Text    id=salary    1234567
    Input Text    id=department    Antioquia
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    id=submit
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    id=delete-record-1
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    id= edit-record-2
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Clear Element Text    id=firstName
    Input Text    id=firstName    Prueba Edición
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Click Element    id=submit
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Input Text    id=searchBox    Kierra
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso4
    Close Browser
