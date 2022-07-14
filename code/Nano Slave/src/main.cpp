#include <Arduino.h>
#include "components.h"
#include <Ultrasonic.h>
#include <Wire.h>
#include <Adafruit_NeoPixel.h>

#define PinEncoder 2
#define PinTriggerI 3     //Izquierdo
#define PinEchoI 8        //Izquierdo
#define PinTriggerD 7     //Derecha
#define PinEchoD 6        //Derecha
#define PinTriggerF 11    //Frontal
#define PinEchoF 4        //Frontal
#define PinTriggerT 13    //Trasero
#define PinEchoT 15       //Trasero
#define PinLed 12
#define PinEnable 14

#define NUMPIXELS 8
#define DELAYVAL 50

volatile long encoder = 0;
volatile long encoderAbsoluto = 0;
bool lecturaEncoder = false;
int vuelta = 1;
//float posicion_servo = 0;
float offset;
volatile float velocidad;
float face = 0;
byte datoEncoder[4];
int distanceFrontal;
int distanceIzquierdo;
int distanceDerecho;
int distanceTrasero;
int velocidadObjetivo;
int encodertotal = 0;
uint32_t tiempo = 0;

void receiveEvent(int howMany);
void requestEvent();
uint8_t requestedData = 0;

uint8_t medidaArray[3];

CServo MiCServo(PinConServo);
Motor MiMotor(PinEnMotor,PinDir1Motor,PinDir2Motor);
Adafruit_NeoPixel pixels(NUMPIXELS, PinLed, NEO_GRB + NEO_KHZ400);

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


Ultrasonic ultrasonicFrontal(PinTriggerF,PinEchoF,10000UL);//Delantero
Ultrasonic ultrasonicIzquierdo(PinTriggerI,PinEchoI,10000UL);//izquierdo
Ultrasonic ultrasonicDerecho(PinTriggerD,PinEchoD,10000UL);//derechos
Ultrasonic ultrasonicAtras(PinTriggerT,PinEchoT,10000UL);//Trasero

void setup() {
  pinMode(PinEnable,OUTPUT);
  digitalWrite(PinEnable,1);
  pinMode(PinEncoder, INPUT);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);

  MiCServo.Setup();

  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event

  Serial.begin(115200);

  pixels.begin();
  delay(100);
  pixels.clear();
  /*for(int i=0; i<NUMPIXELS; i++) {
    pixels.setPixelColor(i, pixels.Color(255, 255, 255));
  }*/
  for(int i=0; i<NUMPIXELS; i++) {

    pixels.setPixelColor(i, pixels.Color(0, 0, 0));
  }
  pixels.show();

  MiCServo.MoverServo(0);

  cli();
  TCCR2A = 0;                 // Reset entire TCCR1A to 0 
  TCCR2B = 0;                 // Reset entire TCCR1B to 0
  TCCR2B |= B00000111;        //Set CS20, CS21 and CS22 to 1 so we get prescalar 1024  
  TIMSK2 |= B00000100;        //Set OCIE1B to 1 so we enable compare match B
  OCR2B = 255;                //Finally we set compare register B to this value 
  sei(); 

}

void LecturaUltrasonidos();

void loop() {
  //put your main code here, to run repeatedly:
  if (millis() > tiempo){
    LecturaUltrasonidos();
    tiempo = millis() + 5;
  }

  if (millis() > tiempo){
    MiMotor.corregirVelocidad(velocidad, velocidadObjetivo);
    tiempo = millis() + 15;
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
      argumentoDegiro = argumentoDegiro*(Wire.read()-1);
      MiCServo.MoverServo(argumentoDegiro);

    }else if(requestedData == 5){
      int valor_enable = Wire.read();
      digitalWrite(PinEnable,valor_enable);

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
  distanceFrontal=ultrasonicFrontal.read();
  distanceIzquierdo=ultrasonicIzquierdo.read();
  distanceDerecho=ultrasonicDerecho.read();
}
