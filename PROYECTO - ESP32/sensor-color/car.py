from machine import Pin

# Definicion de pines de salida para el motor

# Salida Motor A
IN1 = Pin(12, Pin.OUT)
IN2 = Pin(14, Pin.OUT)

# Salida Motor B
IN3 = Pin(27, Pin.OUT)
IN4 = Pin(26, Pin.OUT)

# Arrancar Motor A
def runMotorA():
    IN1.on()
    IN2.off()
    
# Arrancar Motor B
def runMotorB():
    IN3.off()
    IN4.on()
    
# Parar Motor A
def stopMotorA():
    IN1.off()
    IN2.off()

# Parar Motor B
def stopMotorB():
    IN3.off()
    IN4.off()
   
# Arranca ambos motores
def runForward():
    runMotorA()
    runMotorB()
    
# Girar a la derecha
def turnRight():
    runMotorB()
    stopMotorA()
 
# Girar a la izquierda
def turnLeft():
    runMotorA()
    stopMotorB()
    
# Parar ambos motores
def stopAll():
    stopMotorA()
    stopMotorB()