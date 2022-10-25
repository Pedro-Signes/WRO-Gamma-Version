#include <Arduino.h>
#include "components.h"
#include <Ultrasonic.h>
#include <Wire.h>
#include <Adafruit_NeoPixel.h>

#define PinEncoder 2
#define PinTriggerI 11     //Izquierdo      11
#define PinEchoI 4        //Izquierdo       4
#define PinTriggerD 3     //Derecha        3
#define PinEchoD 8        //Derecha         8
#define PinTriggerF 7    //Frontal          12
#define PinEchoF 6        //Frontal         9
#define PinTriggerT 13    //Trasero         13
#define PinEchoT 15       //Trasero         15
#define PinLed 12
#define PinEnable 14

#define NUMPIXELS 8
#define DELAYVAL 50

volatile long encoder = 0;
volatile long encoderAbsoluto = 0;
bool lecturaEncoder = false;
volatile float velocidad;
byte datoEncoder[4];

int distanceFrontal;
int distanceIzquierdo;
int distanceDerecho;
int distanceTrasero;
int prevdistanceFrontal;
int prevdistanceIzquierdo;
int prevdistanceDerecho;
int prevdistanceTrasero;

int velocidadObjetivo = 0;
int encodertotal = 0;
uint32_t tiempo = 0;

bool ESP_prepared = false;

void receiveEvent(int howMany);
void requestEvent();
uint8_t requestedData = 0;

CServo MiCServo(PinConServo);
Motor MiMotor(PinEnMotor,PinDir1Motor,PinDir2Motor);
Adafruit_NeoPixel pixels(NUMPIXELS, PinLed, NEO_GRB + NEO_KHZ800);

void encoderISR() {  // función para que funcien el encoder
  if (forward == true) 
  {
    encoder ++;
    encoderAbsoluto++;
  }
  else
  {
    encoder --;
    encoderAbsoluto--;
  }
  
}

void descartarErrores();

void colors(byte mainPixel, byte currentPixel, int sense){
  if (mainPixel == currentPixel){
    pixels.setPixelColor(currentPixel, pixels.Color(30,0,0));
  }
  else if (((currentPixel - mainPixel) * sense) == -1){
    pixels.setPixelColor(currentPixel, pixels.Color(12,0,0));
  }
  else if (((currentPixel - mainPixel) * sense) == -2){
    pixels.setPixelColor(currentPixel, pixels.Color(4,0,0));
  }
  else {
    pixels.setPixelColor(currentPixel, pixels.Color(0,0,0));
  }
}

Ultrasonic ultrasonicFrontal(PinTriggerF,PinEchoF,8000UL);//Delantero
Ultrasonic ultrasonicIzquierdo(PinTriggerI,PinEchoI,8000UL);//izquierdo
Ultrasonic ultrasonicDerecho(PinTriggerD,PinEchoD,8000UL);//derechos
Ultrasonic ultrasonicTrasero(PinTriggerT,PinEchoT,8000UL);//Trasero

void LecturaUltrasonidos();

void setup() {
  pixels.begin();
  delay(100);
  pixels.clear();
  Serial.begin(115200);

  pinMode(PinEnable,OUTPUT);
  digitalWrite(PinEnable,1);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);
  pinMode(PinEncoder, INPUT);

  MiCServo.Setup();
  MiCServo.MoverServo(0);

  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event

  LecturaUltrasonidos();

  
  byte mainpixel = 0;
  int sense = 1;
  while(!ESP_prepared){
    for(int i=0; i<NUMPIXELS; i++) {
      colors(mainpixel,i,sense);
      if (ESP_prepared){
        break;
      }
    }
    pixels.show();
    delay(120);
    if (mainpixel == NUMPIXELS - 1){
    sense = -1;}
    if (mainpixel == 0){
      sense = 1;
    }
    mainpixel = mainpixel + sense;
  }

  for(int i=0; i<NUMPIXELS; i++) {

    pixels.setPixelColor(i, pixels.Color(100, 100, 100));
  }
  pixels.show();

  cli();
  TCCR2A = 0;                 // Reset entire TCCR1A to 0 
  TCCR2B = 0;                 // Reset entire TCCR1B to 0
  TCCR2B |= B00000111;        //Set CS20, CS21 and CS22 to 1 so we get prescalar 1024
  TIMSK2 |= B00000100;        //Set OCIE1B to 1 so we enable compare match B
  OCR2B = 255;                //Finally we set compare register B to this value 
  sei();
  
}

void loop() {

  
  //put your main code here, to run repeatedly:
  if (millis() > tiempo){
    LecturaUltrasonidos();
    descartarErrores();
    tiempo = millis() + 7;
  }

  if (millis() > tiempo){
    MiMotor.corregirVelocidad(velocidad, velocidadObjetivo);
    tiempo = millis() + 15;
  }

  if(!ESP_prepared){
    static byte mainpixel = 0;
    static int sense = 1;
    for(int i=0; i<NUMPIXELS; i++) {
      colors(mainpixel,i,sense);
      if (ESP_prepared){
        break;
      }
    }
    pixels.show();
    delay(120);
    if (mainpixel == NUMPIXELS - 1){
    sense = -1;}
    if (mainpixel == 0){
      sense = 1;
    }
    mainpixel = mainpixel + sense;
  }
}


void receiveEvent(int howMany) {

  while(howMany > 0 ){
    requestedData = Wire.read();
    howMany--;
    if (requestedData == 3){
      velocidadObjetivo = Wire.read();
      velocidadObjetivo = velocidadObjetivo*(Wire.read()-1);

    }else if(requestedData == 4){     //RX servo
      int argumentoDegiro;
      argumentoDegiro = Wire.read();
      if (!Wire.read()){
        argumentoDegiro = -argumentoDegiro;
      }
      MiCServo.MoverServo(argumentoDegiro);

    }else if(requestedData == 5){
      int valor_enable = Wire.read();
      digitalWrite(PinEnable,valor_enable);
      ESP_prepared = valor_enable;
    }

  }
}

void requestEvent() {

  if (requestedData == 1) {
    datoEncoder[0]=encoderAbsoluto & 0xff;
    datoEncoder[1]=(encoderAbsoluto>>8) & 0xff;

    datoEncoder[2]=(encoderAbsoluto>>16) & 0xff;
    datoEncoder[3]=(encoderAbsoluto>>24) & 0xff;
    Wire.write(datoEncoder,4);
  }
  else if (requestedData == 2){
    Wire.write(distanceFrontal);
    Wire.write(distanceIzquierdo);
    Wire.write(distanceDerecho);
    Wire.write(distanceTrasero);
  }

}

ISR(TIMER2_COMPB_vect){        
  if (lecturaEncoder==true){                  
    velocidad = encoder;
    encodertotal= encodertotal + encoder;
    encoder = 0;
    lecturaEncoder= false;
  }
  else{
    lecturaEncoder=true;
  }
}

void LecturaUltrasonidos(){
  if (forward) {
  distanceFrontal = ultrasonicFrontal.read();
  distanceIzquierdo = ultrasonicIzquierdo.read();
  distanceDerecho = ultrasonicDerecho.read();
  } else {
  distanceTrasero = ultrasonicTrasero.read();
  }
}

void descartarErrores(){
  if (abs(distanceFrontal - prevdistanceFrontal) > 80){
    prevdistanceFrontal = distanceFrontal;
    distanceFrontal = ultrasonicFrontal.read();
  }
  if (abs(distanceTrasero - prevdistanceTrasero) > 80){
    prevdistanceTrasero = distanceTrasero;
    distanceTrasero = ultrasonicTrasero.read();
  }
  if (abs(distanceDerecho - prevdistanceDerecho) > 80){
    prevdistanceDerecho = distanceDerecho;
    distanceDerecho = ultrasonicDerecho.read();
  }
  if (abs(distanceIzquierdo - prevdistanceIzquierdo) > 80){
    prevdistanceIzquierdo = distanceIzquierdo;
    distanceIzquierdo = ultrasonicIzquierdo.read();
  }
}