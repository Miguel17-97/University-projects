
from selenium import webdriver #se importa la librería selenium para automatizar
from selenium.webdriver import Keys
from selenium.webdriver.chrome.service import Service # se crea un controlador el cual va a hacer lo que le digamos
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait #Librerias para controlar el tiempo de aparicion de un elemento web
from selenium.webdriver.support import expected_conditions as EC
import time 

service = Service ("driver/chromedriver.exe")
num = 0 #Contador para el ciclo que mostrará los resultados que necesito
driver = webdriver.Chrome (service=service)
driver.maximize_window()
time.sleep(1)

driver.get("https://www.carulla.com/") #El controlador ingresa a la página carulla.com
time.sleep(1)

menu = driver.find_element(By.XPATH, '/html/body/div[2]/div/div[1]/div/div[2]/div/div/div[2]/div/div[1]/div/div/div/div/div[1]/div/div/div/button')
menu.click()
time.sleep(1) #Ruta para acceder al menu hamburguesa

vida_sana = driver.find_element(By.XPATH, '//*[@id="undefined-nivel2-Vida sana"]')
time.sleep(1)
vida_sana.click()
time.sleep(1) #Ruta para acceder al menu de vida sana

menu_gluten = driver.find_element(By.ID, "Categorías-nivel2-Libre de gluten")
time.sleep(1) #Ruta para acceder al menu Libre de gluten
menu_gluten.click()


wait = WebDriverWait(driver, 10)
ciudad = wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div[10]/div[1]/div/div/div[2]/div[4]/div[1]/div[2]/div/div/div/div[1]/div/div/input')))
ciudad.click()
ciudad.send_keys("Medellín")
time.sleep(1)
ciudad.send_keys(Keys.ENTER)

sede = wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div[10]/div[1]/div/div/div[2]/div[4]/div[3]/div[2]/div/div/div/div[1]/div/div/input')))
sede.click()
sede.send_keys("Carulla Oviedo")
time.sleep(1)
sede.send_keys(Keys.ENTER)

wait = WebDriverWait(driver, 2)
confirmar = wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div[10]/div[1]/div/div/div[2]/div[6]/button')))
confirmar.click()
time.sleep(5)

filtrar = driver.find_element(By.XPATH, '//*[@id="category-2-cereales-avena-y-granolas"]') #Ruta para filtrar los productos libres de gluten
time.sleep(1)
filtrar.click()
time.sleep(8)

print("\n Descripcion y precio de los siguentes 4 productos libres de gluten (Cereales y Granolas): \n"  )


for i in range(1, 5): #Ciclo for para listar los primeros cuatro productos
    num = str(i)
    descripcion = driver.find_element(By.XPATH, '//*[@id="gallery-layout-container"]/div['+num+']/section/a/article/div[3]/div[2]/div/div/div/div[3]/div/div/div/h3/span')
    time.sleep(1)
    precio = driver.find_element(By.XPATH, '//*[@id="gallery-layout-container"]/div['+num+']/section/a/article/div[3]/div[2]/div/div/div/div[4]/div[3]/div/span')
    print(str(i) + ': ' + descripcion.text + "\n ----- " + precio.text + "----- \n")


producto = driver.find_element(By.XPATH, '/html/body/div[2]/div/div[1]/div/div[3]/div/div[11]/section/div[2]/div/div[3]/div/div[2]/div/div/div[6]/div/div/div/div[2]')
time.sleep(1)
producto.click()
time.sleep(3)

driver.execute_script("window.scrollTo(0,document.body.scrollHeight)") #El bot se dirige hacia el final de la página
time.sleep(3)


youtube = driver.find_element(By.XPATH, '/html/body/div[2]/div/div[1]/div/div/div/div[6]/div/div/div[2]/section/div/div[3]/div/div[2]/div/div[1]/div[2]/a[4]')
time.sleep(1)
youtube.click()
time.sleep(1)

driver.quit() #Finalizo el controlador para que no consuma recursos

