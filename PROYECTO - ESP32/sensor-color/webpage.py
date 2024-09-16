import network
import time
import socket
import colorSensor

#Configuración inicial de WiFi
ssid = 'Samsung S20 FE'  #Nombre de la Red
password = 'tlvt8475' #Contraseña de la red

wlan = network.WLAN(network.STA_IF)
wlan.active(True) #Activa el Wifi
wlan.connect(ssid, password) #Hace la conexión

while wlan.isconnected() == False: #Espera a que se conecte a la red
    pass

print('Conexion con el WiFi %s establecida' % ssid)
print(wlan.ifconfig()) #Muestra la IP y otros datos del Wi-Fi

#Pagina web
def web_page():  
    html = """ <html>
                <head>
                    <title>Seguidor de Color RGB - ESP32</title>
                    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1" />
                    <link
                    rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"
                    />
                </head>

                <style>
                    .menu-rgb {
                    background: rgb(255, 0, 0);
                    background: linear-gradient(
                        90deg,
                        rgba(255, 0, 0, 1) 0%,
                        rgba(3, 255, 50, 1) 50%,
                        rgba(0, 41, 255, 1) 100%
                    );
                    }
                </style>

                <body>
                    <!-- Image and text -->
                    <nav class="navbar navbar-danger bg-danger menu-rgb">
                    <a class="navbar-brand" href="#">
                        <!-- <img src="https://microtutorialesdc.com/images/logo.png" width="250" height="30" class="d-inline-block align-top" alt=""> -->
                        <span class="text-white">Vehículo seguidor de color RGB</span>
                    </a>
                    </nav>

                    <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-4">
                        <div class="card" style="width: 18rem">
                            <img
                            src="https://png.pngtree.com/thumb_back/fw800/background/20210207/pngtree-blue-pure-color-simple-background-image_557085.jpg"
                            class="card-img-top"
                            width="500"
                            height="300"
                            />
                            <div class="card-body">
                            <h5 class="card-title">Seguir color Azul</h5>
                            <p class="card-text">El sensor debera buscar el color Azul.</p>
                            <a href="/ledazul=on" class="btn btn-success">ON</a>
                            <!-- Aqui van los pines que se quieren manipular -->
                            <a href="/ledazul=off" class="btn btn-danger">OFF</a>
                            <!-- Aqui van los pines que se quieren manipular -->
                            </div>
                        </div>
                        </div>
                        <div class="col-sm-12 col-md-4">
                        <div class="card" style="width: 18rem">
                            <img
                            src="https://bangbranding.com/blog/wp-content/uploads/2016/09/700x511_SliderInterior.jpg"
                            class="card-img-top"
                            width="500"
                            height="300"
                            />
                            <div class="card-body">
                            <h5 class="card-title">Seguir color Rojo</h5>
                            <p class="card-text">El sensor debera buscar el color Rojo.</p>
                            <a href="/ledrojo=on" class="btn btn-success">ON</a>
                            <!-- Aqui van los pines que se quieren manipular -->
                            <a href="/ledrojo=off" class="btn btn-danger">OFF</a>
                            <!-- Aqui van los pines que se quieren manipular -->
                            </div>
                        </div>
                        </div>
                        <div class="col-sm-12 col-md-4">
                        <div class="card" style="width: 18rem">
                            <img
                            src="https://i.ytimg.com/vi/F5hQ1DK_Vo4/maxresdefault.jpg"
                            class="card-img-top"
                            width="500"
                            height="300"
                            />
                            <div class="card-body">
                            <h5 class="card-title">Seguir color Verde</h5>
                            <p class="card-text">El sensor debera buscar el color Verde.</p>
                            <a href="/ledverde=on" class="btn btn-success">ON</a>
                            <!-- Aqui van los pines que se quieren manipular -->
                            <a href="/ledverde=off" class="btn btn-danger">OFF</a>
                            <!-- Aqui van los pines que se quieren manipular -->
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>

                    <script
                    src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                    crossorigin="anonymous"
                    ></script>
                    <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                    crossorigin="anonymous"
                    ></script>
                    <script
                    src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                    crossorigin="anonymous"
                    ></script>
                </body>
                </html> """
    return html

tcp_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp_socket.bind(('', 80))
tcp_socket.listen(5)

while True:
    conn, addr = tcp_socket.accept()
    #print('Nueva conexion desde:  %s' % str(addr))
    request = conn.recv(1024)
    #print('Solicitud = %s' % str(request))
    request = str(request)
    
    # Busca el parámetro ledrojo de la pagina para activar la busqueda del color rojo
    if request.find('/ledrojo=on') == 6:
        colorSensor.readColor(True, False, False)
        
    # Busca el parámetro ledrojo de la pagina para parar la busqueda del color rojo
    if request.find('/ledrojo=off') == 6:
        print('LED ROJO OFF')
        
    # Busca el parámetro ledverde de la pagina para activar la busqueda del color verde
    if request.find('/ledverde=on') == 6:
        colorSensor.readColor(False, True, False)

    # Busca el parámetro ledverde de la pagina para parar la busqueda del color verde
    if request.find('/ledverde=off') == 6:
        print('LED VERDE OFF')
    
    # Busca el parámetro ledazul de la pagina para activar la busqueda del color azul
    if request.find('/ledazul=on') == 6:
        colorSensor.readColor(False, False, True)
      
    # Busca el parámetro ledazul de la pagina para parar la busqueda del color azul
    if request.find('/ledazul=off') == 6:
        print('LED AZUL OFF')
    
    # Mostrar Página
    response = web_page()
    conn.send('HTTP/1.1 200 OK\n')
    conn.send('Content-Type: text/html\n')
    conn.send('Connection: close\n\n')
    conn.sendall(response)
    conn.close()