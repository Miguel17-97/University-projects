from machine import Pin, PWM, ADC
from time import sleep

motor = True

p1 = Pin(15, Pin.OUT)
p2 = Pin(2, Pin.OUT)
p3 = Pin(0, Pin.OUT)
p4 = Pin(4, Pin.OUT)

SensorIzquierdo = ADC(Pin(35))
SensorDerecho = ADC(Pin(34))
SensorIzquierdo.atten(ADC.ATTN_11DB)
SensorDerecho.atten(ADC.ATTN_11DB)
                    
sensor1 = 0
sensor2 = 0
                 
while motor == True:
                    
    sensor1 = SensorIzquierdo.read()
    sensor2 = SensorDerecho.read()
    
    if sensor1 > 1500:
        sensor1 = 1
    else:
        sensor1 = 0
        
    if sensor2 > 1500:
        sensor2 = 1
    else:
        sensor2 = 0
    
    print('sensor 1', sensor1)
    print('sensor 2', sensor2)
    
    if sensor1 == 1 and sensor2 == 0:
            p1.value(0)
            p2.value(0)
            p3.value(0)
            p4.value(1)
            print('holi')
            if sensor1 == 0 and sensor2 == 0:
                 p1.value(0)
                 p2.value(0)
                 p3.value(0)
                 p4.value(0)
                 print('buenas')
    if sensor2 == 1 and sensor1 == 0:
            p1.value(0)
            p2.value(1)
            p3.value(0)
            p4.value(0)
            print('profeee')
    if sensor1 == 0 and sensor2 == 0:
            p1.value(0)
            p2.value(0)
            p3.value(0)
            p4.value(0)
            print('adios')
    
    if sensor2 == 1 and sensor1 == 1:
            p1.value(0)
            p2.value(1)
            p3.value(0)
            p4.value(1)
            print('5.0')
    if sensor1 == 0 and sensor2 == 0:
            p1.value(0)
            p2.value(0)
            p3.value(0)
            p4.value(0)
            print('adios')
    
    sleep(1)
    #elif sensor1 < 1500 and sensor2 > 1500:
     #       p1.value(0)
      #      p2.value(0)
       #     p3.value(0)
    #else:
     #       p1.value(0)
      #      p2.value(0)
       #     p3.value(0)
        #    p4.value(0)
        
      
            
            
       # else if sensor1 >= 2000:
        #    motor = False
            
    #Movimiento hacia la derecha           
    #if sensor2 > sensor1:
     #   if sensor2 > 1000 and sensor1 <= 1500:
         #   p1.value(0)
          #  p2.value(0)
           # p3.value(0)
            #p4.value(1)
            
       # elif sensor2 >= 2000:
        #    motor = False
    
   
   #if sensor1 == sensor2:
    #        p1.value(0)
     #       p2.value(1)
      #      p3.value(0)
       #     p4.value(1)
  
       # elif sensor2 >= 2000:
        #    motor = False
    
    #if sensor1 > sensor2
    
    
                    


  #  p1.value(0)
   # p2.value(1)
   # p3.value(0)
   # p4.value(1)
    