/*
  ccs811basic.ino - Demo sketch printing results of the CCS811 digital gas sensor for monitoring indoor air quality from ams.
  Created by Maarten Pennings 2017 Dec 11
*/
#include <ESP8266WiFi.h>
#include <WiFiClient.h> 
#include <ESP8266WebServer.h>
#include <ESP8266HTTPClient.h>
#include <Wire.h>    // I2C library
#include "ccs811.h"  // CCS811 library
#define rojo D5
#define verde D6
#define azul D7
/* Set these to your desired credentials. */
const char *ssid = "missid";  //ENTER YOUR WIFI SETTINGS
const char *password = "mipassword";

//Web/Server address to read/write from 
const char *host = "http://mihost";   //http://www.aprendizdetecnologo.com website or IP address of server
const char *direccion=host+'/lectura.php';
// Wiring for ESP8266 NodeMCU boards: VDD to 3V3, GND to GND, SDA to D2, SCL to D1, nWAKE to D3 (or GND)
CCS811 ccs811(D3); // nWAKE on D3

// Wiring for Nano: VDD to 3v3, GND to GND, SDA to A4, SCL to A5, nWAKE to 13
//CCS811 ccs811(13); 

// nWAKE not controlled via Arduino host, so connect CCS811.nWAKE to GND
//CCS811 ccs811; 

// Wiring for ESP32 NodeMCU boards: VDD to 3V3, GND to GND, SDA to 21, SCL to 22, nWAKE to D3 (or GND)
//CCS811 ccs811(23); // nWAKE on 23
//La variable cuenta controlará que se envíe la media de mediciones cada 20'
int cuenta=0;
float media=0;
void setup() {
  // Enable serial
    Serial.begin(115200);
  WiFi.mode(WIFI_OFF); 
  delay(1000);
  WiFi.mode(WIFI_STA);
  
  WiFi.begin(ssid, password); 
Serial.println("");
Serial.println("Connecting...");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
      Serial.println("");
  Serial.print("Connected to ");
  Serial.println(ssid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
  
  Serial.println("");
  Serial.println("setup: Starting CCS811 basic demo");
  Serial.print("setup: ccs811 lib  version: "); Serial.println(CCS811_VERSION);
pinMode(rojo,OUTPUT);
pinMode(verde,OUTPUT);
pinMode(azul,OUTPUT);
digitalWrite(azul,HIGH);
digitalWrite(rojo,LOW);
digitalWrite(verde,LOW);
delay(1000);
digitalWrite(azul,LOW);
  // Enable I2C
  Wire.begin(); 
  
  // Enable CCS811
  ccs811.set_i2cdelay(50); // Needed for ESP8266 because it doesn't handle I2C clock stretch correctly
  bool ok= ccs811.begin();
  if( !ok ) Serial.println("setup: CCS811 begin FAILED");

  // Print CCS811 versions
  Serial.print("setup: hardware    version: "); Serial.println(ccs811.hardware_version(),HEX);
  Serial.print("setup: bootloader  version: "); Serial.println(ccs811.bootloader_version(),HEX);
  Serial.print("setup: application version: "); Serial.println(ccs811.application_version(),HEX);
  
  // Start measuring
  ok= ccs811.start(CCS811_MODE_1SEC);
  if( !ok ) Serial.println("setup: CCS811 start FAILED");
}


void loop() {
    HTTPClient http;
    String estacion,co2,postData;
    estacion="miEstacion";
  // Read
  uint16_t eco2, etvoc, errstat, raw;
  ccs811.read(&eco2,&etvoc,&errstat,&raw); 

  // Print measurement results based on status
  if( errstat==CCS811_ERRSTAT_OK ) { 
    Serial.print("CCS811: ");
    Serial.print("eco2=");  Serial.print(eco2);     Serial.print(" ppm  ");
    Serial.print("etvoc="); Serial.print(etvoc);    Serial.print(" ppb  ");
    //Serial.print("raw6=");  Serial.print(raw/1024); Serial.print(" uA  "); 
    //Serial.print("raw10="); Serial.print(raw%1024); Serial.print(" ADC  ");
    //Serial.print("R="); Serial.print((1650*1000L/1023)*(raw%1024)/(raw/1024)); Serial.print(" ohm");
    Serial.println();
    if (eco2<600){
      digitalWrite(azul,HIGH);
digitalWrite(rojo,LOW);
digitalWrite(verde,LOW);
    }else if (eco2<800){
      digitalWrite(azul,LOW);
digitalWrite(rojo,HIGH);
digitalWrite(verde,HIGH);
    }else{
      digitalWrite(azul,LOW);
digitalWrite(rojo,HIGH);
digitalWrite(verde,LOW);
    }
    //Tras la última lectura, comprobamos si ya toca enviar datos a la base
      cuenta++;
  media+=eco2;
  if (cuenta>900){
    media=media/cuenta;
    co2=String(media);
    postData = "valor="+co2+"&estacion=" + estacion ;
  
  http.begin(direccion);  
 http.addHeader("Content-Type", "application/x-www-form-urlencoded");
   int httpCode = http.POST(postData); 
    String payload = http.getString();
    
  Serial.println(httpCode);
    Serial.println(payload);  
    
  http.end(); 
  // Wait
  delay(1000); 
  cuenta=0;
  media=0;
  }
  } else if( errstat==CCS811_ERRSTAT_OK_NODATA ) {
    Serial.println("CCS811: waiting for (new) data");
  digitalWrite(azul,HIGH);
digitalWrite(rojo,HIGH);
digitalWrite(verde,HIGH);
  } else if( errstat & CCS811_ERRSTAT_I2CFAIL ) { 
    Serial.println("CCS811: I2C error");
    digitalWrite(azul,HIGH);
digitalWrite(rojo,LOW);
digitalWrite(verde,HIGH);
  } else {
    Serial.print("CCS811: errstat="); Serial.print(errstat,HEX); 
    Serial.print("="); Serial.println( ccs811.errstat_str(errstat) ); 
  }
  delay(1000);
}
