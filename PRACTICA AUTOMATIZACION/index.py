from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time


service = Service ("driver/chromedriver.exe")
clave = "PORTATILES LENOVO GAMERS"
num = 0
driver = webdriver.Chrome (service=service)
driver.maximize_window()
time.sleep(1)


driver.get("https://www.mercadolibre.com.co/")
time.sleep(1)

cookies = driver.find_element(By.XPATH, '/html/body/div[2]/div[1]/div/div[3]/button[1]')
time.sleep(2)
cookies.click()
time.sleep(1)


more_later = driver.find_element(By.XPATH, '/html/body/div[3]/div/div/div[2]/div/div/div[2]/button[2]/span')
more_later.click()
time.sleep(1)


search = driver.find_element(By.XPATH, '/html/body/header/div/div[2]/form/input')
search.click()
time.sleep(1)
search.send_keys(clave)


buscar = driver.find_element(By.XPATH, '/html/body/header/div/div[2]/form/button/div')
buscar.click()
time.sleep(3)

print("\n Descripcion y precio de los siguentes 10 computadores: \n"  )

for i in range(1, 11):
    num = str(i)
    try:
        oferta = driver.find_element(By.XPATH, '/html/body/main/div/div[2]/section/ol/li['+num+']/div/div/div[2]/div[1]/div/label')
        descripcion = driver.find_element(By.XPATH, '/html/body/main/div/div[2]/section/ol/li['+num+']/div/div/div[2]/div[2]/a/h2')
        precio = driver.find_element(By.XPATH, '/html/body/main/div/div[2]/section/ol/li['+num+']/div/div/div[2]/div[3]/div[1]/div[1]/div/div/div/span[1]/span[2]/span[2]')
    except: 
        descripcion = driver.find_element(By.XPATH, '/html/body/main/div/div[2]/section/ol/li['+num+']/div/div/div[2]/div[1]/a/h2')
        precio = driver.find_element(By.XPATH, '/html/body/main/div/div[2]/section/ol/li['+num+']/div/div/div[2]/div[2]/div[1]/div[1]/div/div/div/span[1]/span[2]/span[2]')
    print(str(i) + ': ' + descripcion.text + "\n ----- " + precio.text + "----- \n")

