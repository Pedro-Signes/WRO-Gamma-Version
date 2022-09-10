#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <Pixy2.h>



#define PIN_BOTON 13

float valorBrujula = 0;
float offset;
int vuelta = 1;
int giros = 0;
bool sentidoGiro = true;
bool LecturaGiro = true;

int ErrorDireccionAnterior = 0;
int ErrorDireccionActual = 0;
int direccionObjetivo = 0; 

bool GiroRealizado = true;
bool PrimeraParada = true;
bool SegundaParada = true;
bool AutoGiro = true;

int velocidad = 0;
int encoderAMover = 0;

uint32_t Duracion_de_la_muestra = 0;

long solicitudEncoder();
byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraIzquierdo = 1;
byte ultraDerecho = 2;
byte ultraTrasero = 3;

long medidaencoder = 0;
long MarcaEncoder = 0;
bool destino = true;

bool forward = true;

enum e{
  Inicio,
  Recto,
  DecidiendoGiro,
  ManiobraDerecha1,
  ManiobraDerecha2,
  ManiobraDerecha3,
  ManiobraDerecha4,
  ParadaNoSeQueMasHacer,
  Atras,
  Final
};

int estado = e::Inicio;


/*void Calibrar(){ // función para calibrar ( revisar )
  mpu.verbose(true);  
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}*/


long medirEncoder() {
  Wire.beginTransmission(4);
  Wire.write(1);
  Wire.endTransmission();
  Wire.requestFrom(4,4);
  long _medidaEncoder;
  byte iteracion = 0;
  while( iteracion < 4){
    _medidaEncoder = _medidaEncoder | Wire.read()<<(8*iteracion);
    iteracion++;
  }
  return _medidaEncoder;
}

// Devuelve la posición donde hay que poner el servo
int ErrorDireccion(int bearing, int target){
  int error = bearing - target;
  if (error == 0) return 0;
  if (error > 180) error -= 360;
  if (error < -180) error += 360;
  return -2*error;
}


void setEnable(int motrorEnable){
  Wire.beginTransmission(4);
  Wire.write(5);
  Wire.write(motrorEnable);
  Wire.endTransmission();
}

void setGiro(int posicionServo){
  Wire.beginTransmission(4);
  Wire.write(4);
 
  if(posicionServo<0){
    Wire.write(-posicionServo);
    Wire.write(0);
  }else{
    Wire.write(posicionServo);
    Wire.write(2);
  }
  Wire.endTransmission();
}

void setVelocidad(int velocidad){
  Wire.beginTransmission(4);
  Wire.write(3);
  if(velocidad<0){
    Wire.write(-velocidad);
    Wire.write(0);
    forward = false;
  }else{
    Wire.write(velocidad);
    Wire.write(2);
    forward = true;
  }
  Wire.endTransmission();
}

void enviarMensaje(int numero){
 Serial.println(numero);
}
void enviarMensaje(String texto){
 Serial.println(texto);
}

void medirUltrasonidos(){

  Wire.beginTransmission(4);
  Wire.write(2);
  Wire.endTransmission();
  Wire.requestFrom(4,4);
  byte iteracion = 0;
  while (Wire.available()){
    medidasUltrasonidos[iteracion] = Wire.read();
    iteracion++;
  }
}

String maquina(String order, String arg){
  if (order == String("encoder")){
    MarcaEncoder = medidaencoder;
    destino = true;
    setVelocidad(velocidad);
    encoderAMover = String(arg).toInt();
    return ("encoder establecido");
  }
  else if (order == String("vel")) {
    velocidad = String(arg).toInt();
    return ("velocidad establecida");
  }
  else if (order == String("servo")) {
    setGiro(String(arg).toInt());
    return ("servo establecido");
  }else{
    return order;}
}

void setup() {
  Serial.begin(115200);


  pinMode(PIN_BOTON ,INPUT_PULLUP);

  pinMode(LED_BUILTIN,OUTPUT);
  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);
  WiFi.disconnect(true);
  WiFi.mode(WIFI_OFF);

  digitalWrite(LED_BUILTIN,HIGH);

  

  

  while (digitalRead(PIN_BOTON));
  setEnable(1);
  delay(1000);

}


void loop() {
  medidaencoder = medirEncoder();

  if (Serial.available()){
    String order = Serial.readString();
    delay(500);
    String argument = Serial.readString();
    Serial.println(maquina(order, argument));
  }
  if (abs(medidaencoder - MarcaEncoder) > encoderAMover && destino){
    setVelocidad(0);
    destino = false;
    Serial.println("Destino alcanzado");
  }

  delay(30);
}