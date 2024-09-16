from machine import Pin
import time
import car

def readColor(readRed, readGreen, readBlue):
    try:
        # Definicion de pines de salida y entrada
        TCS230_PIN_S0 = Pin(2, Pin.OUT)				# Entrada del sensor S0 al pin 2 del ESP32
        TCS230_PIN_S1 = Pin(4, Pin.OUT)				# Entrada del sensor S1 al pin 4 del ESP32
        TCS230_PIN_S2 = Pin(5, Pin.OUT)				# Entrada del sensor S2 al pin 5 del ESP32
        TCS230_PIN_S3 = Pin(16, Pin.OUT)				# Entrada del sensor S0 al pin 16 del ESP32
        TCS230_PIN_OUT = Pin(0, Pin.IN, Pin.PULL_UP) # Salida del sensor OUT al pin 0 del ESP32
        
        # Definicion de Pines para luces LED
        LED_RED = Pin(21, Pin.OUT)
        LED_BLUE = Pin(22, Pin.OUT)
        LED_GREEN = Pin(23, Pin.OUT)     
        
        # variables para rango de colores
        red = 0
        blue = 0
        green = 0
        cont = 1
        
        # Configura la escala de frecuencia en 100% para iniciar la captura del sensor
        TCS230_PIN_S0.on()
        TCS230_PIN_S1.on()
        
        # Enlaza el manejador de la salida del sensor
        TCS230_PIN_OUT.irq(trigger=Pin.IRQ_FALLING,handler=wait_for_edge)
        
        while cont <= 40:
            # Activa color Rojo
            TCS230_PIN_S2.off()
            TCS230_PIN_S3.off()
            red = measure()
            
            # Activa color Azul
            TCS230_PIN_S2.off()
            TCS230_PIN_S3.on()
            blue = measure()
            
            # Activa color Verde
            TCS230_PIN_S2.on()
            TCS230_PIN_S3.on()
            green = measure()
            
            LED_RED.off()
            LED_BLUE.off()
            LED_GREEN.off()
            
            if (red < 2600) and (green > 3500) and (blue > 2400) and readRed:
                LED_RED.on()
                car.runForward()
                print("****** ROJO ******")
            elif (blue < red) and (blue < green) and (blue < 1800) and readBlue:
                LED_BLUE.on()
                car.runForward()
                print("****** AZUL ******")
            elif (green < red) and (green < blue) and (green < 3600) and readGreen:
                LED_GREEN.on()
                car.runForward()
                print("****** VERDE ******")
            else:
                car.stopAll()
                LED_RED.off()
                LED_BLUE.off()
                LED_GREEN.off()
                
            print("red: ", red, "blue: ", blue, "green: ", green, "Cont: ", cont)
            cont = cont + 1
            
        car.stopAll()
        LED_RED.off()
        LED_BLUE.off()
        LED_GREEN.off()
            
    except Exception as e:
        print('Error executing code: ', str(e))

# Funcion que gestiona la interrupcion y la detección del impulso
def wait_for_edge(pin):
    global edge
    edge = True # Variable global para memorizar la detección del impulso

# Funcion para calcular la medida del sensor
def measure():
    global edge
    delta = 0
    time.sleep_ms(100)
    start = time.ticks_us()
    for counter in range(10): # Medida de 10 interrupciones
        edge = False
        while edge==False:
            pass
    delta = time.ticks_diff(time.ticks_us(),start) # Diferencia en tiempo
    return delta
