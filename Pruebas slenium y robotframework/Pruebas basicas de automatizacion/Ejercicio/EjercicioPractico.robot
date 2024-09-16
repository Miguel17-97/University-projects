*** Settings ***
Resource    recursos.robot

Documentation       Aplicar grabacion y capturas de pantalla.
...                 Cubrir 2 navegadores.
...                 Aplicar conceptos de ciclo, archivo de recursos, variables y condicional.
...                 Aplicar en un mismo ejercicio lo anteriormente mencionado.

*** Test Cases ***
G001 Ejercicio
    Seleccionar navegador
    Maximize Browser Window
    sleep    2s
    Captura de pantalla
    sleep    1s
    Click Element    Xpath://*[@id="menu-item-my-account-options"]/div
    Wait Until Element Is Visible    Xpath=/html/body/div[2]/div/div[1]/div/div[3]/div/div/div/div[2]/div/div/form/div[1]/label/div/input    10s
    Sleep     2s
    Verificar usuario
    Element Text Should Be    Xpath=/html/body/div[2]/div/div[1]/div/div[3]/div/div/div/div[2]/div/div/form/div[3]    Usuario y/o contraseña equivocada
    Pagina Principal
    Sleep    2s
    Busqueda
    Sleep     3s 
    Set Global Variable    @{Precios}      //*[@id="gallery-layout-container"]/div[1]/section/a/article/div/div[1]/div/div[1]/div/div/img    //*[@id="gallery-layout-container"]/div[2]/section/a/article/div/div[1]/div/div[1]/div/div/img   
    FOR  ${Precios}  IN     @{Precios}  
        Click Element    xpath=${Precios}
        Sleep    2s
        Click Element    xpath=/html/body/div[2]/div/div[1]/div/div/div/div[3]/div/div[1]/div/section/div/div/div/div[1]/div/div/div/div/span[3]/a
        Sleep    2s
    END 
    Sleep    3s
    Close Browser
    
    
    
                 
    
    