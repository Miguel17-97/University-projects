#practica Formulario Si
#Alerts
   # Browser window
  #     Las tres
 #  Modal
#Widges todo completo
#Book Store los tres primeros

#Aplicarle las dos librerias
#Cada equipo escoger otra libreria

*** Settings ***
Resource    recursos.robot

*** Test Cases ***
G001 Prueba formulario
    Abrir Navegador y Esperar Logo
    Maximize Browser Window
    Execute Javascript    document.documentElement.style.zoom = "50%";
    Sleep     3s
    Click Element    xpath=//*[@id="app"]/div/div/div[2]/div[1]/div/div/div[2]/span/div
    #Click Element    xpath=//*[@id="item-0"]/span
    Sleep     5s


