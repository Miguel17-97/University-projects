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
G008 Upload and Download
    ${ruta_carpeta}=    Set Variable    ./Reportes/Elements/Caso8
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Elements')]
    Take Screenshot    ${ruta_carpeta}/Caso8
    Click Element    xpath=//div[contains(text(),'Elements')]
    Sleep    1s
    Wait Until Element Is Visible    xpath=//span[text() = 'Web Tables']
    Execute JavaScript    window.scrollBy(0,800)    # Ajustar la posición de la página
    Sleep    1s
    Click Element    xpath=//span[text()='Upload and Download']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso8

    # Descargar un archivo
    Click Element    id=downloadButton
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso8

    # Subir un archivo
    ${file_path}=    Set Variable    ${CURDIR}/my_file.txt
    Choose File    id=uploadFile    ${file_path}
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso8
    

    Close Browser