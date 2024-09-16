*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion
Library             Selenium2Library

*** Variables ***
${VariablePalabraBuscar}   casos de prueba
${variable12}   pedro perez


*** Test Cases ***
G001 Búsqueda de palabras en google
    Open Browser    https://www.google.com/     chrome
    Wait Until Element Is Visible   xpath=//*[@id="hplogo"]
    Input Text      xpath=//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input     ${VariablePalabraBuscar}
    Click Element       xpath=//*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[100]
    Title Should Be     ${VariablePalabraBuscar} - Buscar con Google
    Page Should Contain     ${VariablePalabraBuscar}
    Close Browser