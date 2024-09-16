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
G003 Date Picker
    ${ruta_carpeta}=    Set Variable    ./Reportes/Widgets/Caso3
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Execute JavaScript    window.scrollBy(0,350)
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Widgets')]
    Take Screenshot    ${ruta_carpeta}/Caso3
    Click Element    xpath=//div[contains(text(),'Widgets')]
    Wait Until Element Is Visible    xpath=//span[text() = 'Date Picker']
    Click Element    xpath=//span[text() = 'Date Picker']
    Take Screenshot    ${ruta_carpeta}/Caso3
    Click Element    id = datePickerMonthYearInput
    Sleep    1s
    Click Element    xpath=//select[@class = 'react-datepicker__year-select']
    Sleep    1s
    Click Element    xpath=//option[text()= '2020']
    Sleep    1s
    Click Element    xpath=//select[@class = 'react-datepicker__month-select']
    Sleep    1s
    Click Element    xpath=//option[text()= 'July']
    Sleep    1s
    Click Element    xpath=//div[text() = '3']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso3

    Click Element    id = dateAndTimePickerInput
    Sleep    1s
    Click Element    xpath=//div[@class = 'react-datepicker__year-read-view']
    Sleep    1s
    Click Element    xpath=//div[text()= '2020']
    Sleep    1s
    Click Element    xpath=//div[@class = 'react-datepicker__month-read-view']
    Sleep    1s
    Click Element    xpath=//div[text()= 'July']
    Sleep    1s
    Click Element    xpath=//div[text() = '3']
    Sleep    1s
    Click Element    xpath=//li[text() = '09:15']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso3
    Close Browser
