

import dht 
from machine import Pin, I2C
from bmp085 import BMP180
import time
from time import sleep

#DHT
sensor = dht.DHT11(Pin(22))

#BMP
i2c = I2C(0, scl=Pin(1), sda=Pin(0), freq=100000)
bmp = BMP180(i2c)
bmp.oversample = 2
bmp.sealevel = 101325


###################### FUNCTIONS
def get_dht11():
    try:

        sensor.measure()
        temp = sensor.temperature()
        hum = sensor.humidity()
        temp_f = temp * (9/5) + 32.0
        
        print("DHT11 temp " + str(temp) +"°C      Hum: "+str(hum) +"%")

    except OSError as e:
        print('Failed to read sensor.')

    
def get_bmp():
    tempC = bmp.temperature        #get the temperature in degree celsius
    pres_hPa = bmp.pressure        #get the pressure in hpa
    altitude = bmp.altitude        #get the altitude
    temp_f= (tempC * (9/5) + 32)   #convert the temperature value in fahrenheit
    print("BMP   temp "+str(tempC)+" °C   Press " + str(pres_hPa)+" hPa    Alt "+ str(altitude)+" m")
    #print("-------------------------------------------------------------------")
    

################################
while True:
    time.sleep_ms(1000)   #delay of 100 milliseconds
    get_bmp()
    get_dht11()
    print("-------------------------------------------------------------------")
        
