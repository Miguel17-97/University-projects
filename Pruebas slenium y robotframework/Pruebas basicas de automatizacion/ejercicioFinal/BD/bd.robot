*** Settings ***
Suite Teardown    Disconnect From Database
Library    DatabaseLibrary
Library    OperatingSystem
Library    Selenium2Library
Library           Collections

*** Variables ***
${DBName}        robot_prueba
${DBUser}        robot_prueba
${DBPass}        123456abc
${DBHost}        127.0.0.1
${DBPort}        3306
${URL}           https://www.mercadolibre.com.co/
${Browser}       chrome

*** Keywords ***

*** Test Cases ***
Conectar a base de datos MySQL
    Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}

Crear una tabla
    Execute Sql String    CREATE TABLE productos(id integer, nombre varchar(20), cantidad integer(100));
    Execute Sql String    CREATE TABLE clientes(id integer(10), nombre varchar(20), apellido varchar(20), edad integer(2));

Insertar productos
    Execute Sql String    INSERT INTO productos VALUES(01,'Iphone 14',58);
    Execute Sql String    INSERT INTO productos VALUES(02,'Ipad Pro',70);
    Execute Sql String    INSERT INTO productos VALUES(03,'Xiaomi Pro',32);
    Execute Sql String    INSERT INTO productos VALUES(04,'Audifonos sony',10);

Insertar clientes
    Execute Sql String    INSERT INTO clientes VALUES(1000888999,'Julian','Naranjo',20);

Modificar datos cliente
    Execute Sql String    UPDATE `robot_prueba`.`clientes` SET `id`='1234561234' WHERE `nombre`='Julian';

Consultar producto en DB y buscarlo en mercado libre 
    ${nombre}    Query    SELECT nombre FROM productos WHERE id=01;
    ${producto}=    Set Variable    ${nombre[0][0]}
    Open Browser    ${URL}     ${Browser}
    Maximize Browser Window
    @{list}    Query    SELECT nombre FROM productos;
    FOR  ${productoList}  IN  @{list}
        Input Text        xpath=//*[@id="cb1-edit"]    ${productoList}
        Sleep    2s
        Click Element    xpath=/html/body/header/div/div[2]/form/button/div
        Sleep    2s
        Clear Element Text    xpath=//*[@id="cb1-edit"]
        Sleep    2s
    END
    Sleep     5s
    Close Browser

#Eliminar tablas
#    Execute Sql String    DROP TABLE productos;
 #   Execute Sql String    DROP TABLE clientes;
    
    
