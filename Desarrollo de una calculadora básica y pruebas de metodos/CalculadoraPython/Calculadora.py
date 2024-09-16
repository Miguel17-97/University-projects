def suma(a, b):
    if a == None or b == None:
        return 0
    else: 
        return a + b

def resta(a, b):
    if a == None or b == None:
        return 0
    else: 
        return a - b

def multiplicacion(a, b):
    if a == None or b == None:
        return 0
    else: 
        return a * b

def division(a, b):
    if a == None or b == None:
        return 0
    else: 
        if b != 0:
            return a / b
        else:
            return "No se puede dividir por cero."

# Solicitar entrada al usuario
num1 = 3
num2 = 2


# Realizar operaciones según la elección
resultado = 0
resultado = suma(num1, num2)
resultado = resta(num1, num2)
resultado = multiplicacion(num1, num2)
resultado = division(num1, num2)

# Mostrar el resultado
#print( f"Resultado: {resultado}")
