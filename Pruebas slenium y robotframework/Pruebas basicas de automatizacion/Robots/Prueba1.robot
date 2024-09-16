*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion

Library             Selenium2Library

*** Test Cases ***
G001 Búsqueda de palabras en google
    Open Browser    https://www.google.com/     chrome 
    Wait Until Element Is Visible	xpath=/html/body/div[1]/div[2]/div/a/picture/img     
    Input Text      xpath=/html/body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/textarea     casos de prueba  
    sleep  5s	
    Click Element	xpath=/html/body/div[1]/div[3]/form/div[1]/div[1]/div[2]/div[2]/div[7]/center/input[1]                
    sleep  5s    
    Title Should Be     casos de prueba - Buscar con Google
    Page Should Contain     casos de prueba
    sleep  10s
    Close Browser