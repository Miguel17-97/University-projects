*** Settings ***
Resource    recursos.robot

*** Test Cases ***
G001 Búsqueda de palabras en google
    Abrir Navegador y Esperar Logo
    Input Text      xpath=//*[@id="lst-ib"]     ${palabraABuscar}
    Click Element       xpath=//*[@id="tsf"]/div[2]/div[3]/center/input[1]
    Title Should Be     ${palabraABuscar} - Buscar con Google
    Page Should Contain     ${palabraABuscar}
    Close Browser

G002 Hacer click en el botón de búsqueda sin escribir palabras en Google
    Abrir Navegador y Esperar Logo
    Click Element       xpath=//*[@id="tsf"]/div[2]/div[3]/center/input[1]
    Title Should Be     Google
    Close Browser
