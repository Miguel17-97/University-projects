*** Settings ***
Documentation       Existe en un documento de texto los pasos manuales
...                 Esta es mi primera automatizacion

Library             Selenium2Library


*** Test Cases ***
G001 Búsqueda de palabras en google
    Open Browser    https://www.google.com/     chrome 
    Wait Until Element Is Visible	xpath=//img[@class='lnXdpd']   
    Input Text      xpath=//textarea[@class = 'gLFyf']    casos de prueba  
    sleep  5s	
    Click Element	xpath=(//span[text() = 'casos de prueba'])[1]	                
    sleep  5s    
    Title Should Be    casos de prueba - Buscar con Google
    Page Should Contain    casos de prueba
    sleep  10s
