from machine import Pin, UART
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
 
 
#BT 
uart = UART(1, 9600)

#LED
led = Pin(25, Pin.OUT)

###################### FUNCTIONS
def get_dht11():
    try:

        sensor.measure()
        temp = sensor.temperature()
        hum = sensor.humidity()
        temp_f = temp * (9/5) + 32.0
        
        print("DHT11 temp " + str(temp) +"°C      Hum: "+str(hum) +"%")
        uart.write("DHT11 temp " + str(temp) +"°C      Hum: "+str(hum) +"% ")

        
    except OSError as e:
        print('Failed to read sensor.')

    
def get_bmp():
    tempC = bmp.temperature        #get the temperature in degree celsius
    pres_hPa = bmp.pressure        #get the pressure in hpa
    altitude = bmp.altitude        #get the altitude
    temp_f= (tempC * (9/5) + 32)   #convert the temperature value in fahrenheit
    print("BMP   temp "+str(tempC)+" °C   Press " + str(pres_hPa)+" hPa    Alt "+ str(altitude)+" m")
    #print("-------------------------------------------------------------------")
    uart.write("BMP temp "+str(tempC)+" °C   Press " + str(pres_hPa)+" hPa    Alt "+ str(altitude)+" m\n")
    

################################

 
while True:
  if uart.any() > 0:
    data = uart.read()
    print(data)
    if "on" in data:
      led.value(1)
      print('LED on \n')
      uart.write('LED on \n')
    elif "off" in data:
      led.value(0)
      print('LED off \n')
      uart.write('LED off \n')
    elif "bounce" in data:
     time.sleep_ms(1000)   #delay of 100 milliseconds
     get_dht11()
     get_bmp()
     print("-------------------------------------------------------------------")
        
