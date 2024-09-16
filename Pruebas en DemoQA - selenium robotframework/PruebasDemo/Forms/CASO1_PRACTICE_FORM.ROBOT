*** Settings ***
Documentation       DataDriver Testing With Excel

Library             SeleniumLibrary
Library             Screenshot
Library             OperatingSystem
Library             XML
Library             DataDriver  CASO1_PRACTICE_FORM.xlsx
Test Template       Read All The Data


*** Variables ***
${URL}          https://demoqa.com/interaction
${Navegador}    chrome
${archivo}      C:/Users/Carlos/Music/PruebasDemo/Forms/ejemplo.jpg
${FIRSTNAME}    id:firstName


*** Keywords ***
Verify All The Data From Excel      ${name}
    [Arguments] ${name}
    Log To Console  ${name}

*** Test Cases ***
G001 Practice Form
    ${ruta_carpeta}=    Set Variable    ./Reportes/Forms/Caso1
    ${creada}=    Run Keyword And Return Status    Create Directory    ${ruta_carpeta}
    Open Browser    ${URL}    ${Navegador}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//div[contains(text(),'Forms')]
    Take Screenshot    ${ruta_carpeta}/Caso1
    Click Element    xpath=//div[contains(text(),'Forms')]
    Click Element    xpath=//span[text() = 'Practice Form']
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Execute JavaScript    window.scrollBy(0,220)
    Input Text    ${FIRSTNAME}   ${name}
    Input Text    id=lastName    Forms
    Input Text    id=userEmail    forms@gmail.com
    Click Element    xpath = //label[text()='Male']
    Input Text    id=userNumber    1234567891
    Click Element    id = dateOfBirthInput
    Click Element    xpath=//select[@class = 'react-datepicker__year-select']
    Click Element    xpath=//option[text()= '2015']
    Click Element    xpath=//select[@class = 'react-datepicker__month-select']
    Click Element    xpath=//option[text()= 'December']
    Click Element    xpath=//div[text() = '3']
    Input Text    id=subjectsInput    English
    Press Keys    id=subjectsInput    ENTER
    Click Element    xpath = //label[text()='Sports']
    Choose File    uploadPicture    ${archivo}
    Input Text    id=currentAddress    Cll 10 PJIC
    Execute JavaScript    document.getElementById("currentAddress").style.height='36px';
    Execute JavaScript    window.scrollBy(0,150)
    Input Text    id=react-select-3-input    NCR
    Press Keys    id=react-select-3-input    ENTER
    Input Text    id=react-select-4-input    Noida
    Press Keys    id=react-select-4-input    ENTER
    Sleep    1s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Press Keys    id=react-select-4-input    TAB+TAB+ENTER
    Sleep    2s
    Take Screenshot    ${ruta_carpeta}/Caso1
    Close Browser
