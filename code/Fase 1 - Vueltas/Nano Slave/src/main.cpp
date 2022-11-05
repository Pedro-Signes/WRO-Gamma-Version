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
bool discard[4] = {true, true, true, true};

int velocidadObjetivo = 0;

byte UltraMedir = 0;

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
void enviar();

void telemetria() {
  Serial.print("\t");
  Serial.print(velocidad);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(velocidadObjetivo);
  Serial.print(",");
  Serial.print("\t");
  Serial.println(MiMotor.GetPotencia());
}

void colors(byte mainPixel, byte currentPixel, int sense) {
  if (mainPixel == currentPixel) {
    pixels.setPixelColor(currentPixel, pixels.Color(30,0,0));
  } 
  else if (((currentPixel - mainPixel) * sense) == -1) {
    pixels.setPixelColor(currentPixel, pixels.Color(12,0,0));
  } 
  else if (((currentPixel - mainPixel) * sense) == -2) {
    pixels.setPixelColor(currentPixel, pixels.Color(4,0,0));
  } 
  else {
    pixels.setPixelColor(currentPixel, pixels.Color(0,0,0));
  }
}

Ultrasonic ultrasonicFrontal(PinTriggerF,PinEchoF,9000UL);          //Delantero
Ultrasonic ultrasonicIzquierdo(PinTriggerI,PinEchoI,9000UL);        //izquierdo
Ultrasonic ultrasonicDerecho(PinTriggerD,PinEchoD,9000UL);          //derechos
Ultrasonic ultrasonicTrasero(PinTriggerT,PinEchoT,9000UL);          //Trasero

void LecturaUltrasonidos();
void allUltrasonic();

void setup() {
  pixels.begin();
  delay(100);
  pixels.clear();
  Serial.begin(115200);
  Serial.println("Serial a punto");

  pinMode(PinEnable,OUTPUT);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);
  pinMode(PinEncoder, INPUT);

  MiCServo.Setup();
  MiCServo.MoverServo(0);

  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event

  for (byte i = 0; i < 5; i++) {
    allUltrasonic;
    delay(300);
  }
  
  byte mainpixel = 0;
  int sense = 1;
  while (!ESP_prepared) {
    for (int i=0; i<NUMPIXELS; i++) {
      colors(mainpixel,i,sense);
      if (ESP_prepared) {
        break;
      }
    }
    pixels.show();
    delay(120);
    if (mainpixel == NUMPIXELS - 1) {
      sense = -1;
    } else if (mainpixel == 0) {
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

  static uint32_t prev_ms_ultrasonic;
  if (millis() > prev_ms_ultrasonic) {
    LecturaUltrasonidos();
    descartarErrores();
    if (UltraMedir == 2) {
      UltraMedir = 0;
    } else {
      UltraMedir++;
    }
    prev_ms_ultrasonic = millis() + 7;
  }

  static uint32_t prev_ms_speed;
  if (millis() > prev_ms_speed) {
    MiMotor.corregirVelocidad(velocidad, velocidadObjetivo);
    telemetria();
    prev_ms_speed = millis() + 15;
  }

  if (!ESP_prepared) {
    static byte mainpixel = 0;
    static int sense = 1;
    for(int i=0; i<NUMPIXELS; i++) {
      colors(mainpixel,i,sense);
    }
    pixels.show();
    delay(120);
    if (mainpixel == NUMPIXELS - 1) {
    sense = -1;
    } else if (mainpixel == 0) {
      sense = 1;
    }
    mainpixel = mainpixel + sense;
  }
}


void receiveEvent(int howMany) {
  while (howMany > 0 ) {
    requestedData = Wire.read();
    howMany--;
    if (requestedData == 3) {
      velocidadObjetivo = Wire.read();
      if (!Wire.read()) {
        velocidadObjetivo = -velocidadObjetivo;
      }
    } else if(requestedData == 4) {     //RX servo
      int argumentoDegiro;
      argumentoDegiro = Wire.read();
      if (!Wire.read()) {
        argumentoDegiro = -argumentoDegiro;
      }
      MiCServo.MoverServo(argumentoDegiro);

    } else if(requestedData == 5) {
      int valor_enable = Wire.read();
      digitalWrite(PinEnable, valor_enable);
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

ISR(TIMER2_COMPB_vect) {        
  if (lecturaEncoder == true) {                  
    velocidad = encoder;
    encoder = 0;
    lecturaEncoder = false;
  } else {
    lecturaEncoder = true;
  }
}

void LecturaUltrasonidos() {
  if (forward) {
    if (UltraMedir == 0) {
      distanceFrontal = ultrasonicFrontal.read();
    } else if (UltraMedir == 1) {
      distanceDerecho = ultrasonicDerecho.read();
    } else {
      distanceIzquierdo = ultrasonicIzquierdo.read();
    }
  } else {
    distanceTrasero = ultrasonicTrasero.read();
  }
}

void allUltrasonic() {
  byte d1f = ultrasonicFrontal.read();    // distancia de prueba 1 (frontal)
  byte d1t = ultrasonicTrasero.read();    // distancia de prueba 1 (trasero)
  byte d1d = ultrasonicDerecho.read();    // distancia de prueba 1 (derecho)
  byte d1i = ultrasonicIzquierdo.read();  // distancia de prueba 1 (izquierdo)
  delay(200);
  byte d2f = ultrasonicFrontal.read();    // distancia de prueba 2 (frontal)
  byte d2t = ultrasonicTrasero.read();    // distancia de prueba 2 (trasero)
  byte d2d = ultrasonicDerecho.read();    // distancia de prueba 2 (derecho)
  byte d2i = ultrasonicIzquierdo.read();  // distancia de prueba 2 (izquierdo)
  if (abs(d1f - d2f) < 10){
    distanceFrontal = d2f;
  }
  if (abs(d1t - d2t) < 10){
    distanceFrontal = d2t;
  }
  if (abs(d1d - d2d) < 10){
    distanceFrontal = d2d;
  }
  if (abs(d1i - d2i) < 10){
    distanceFrontal = d2i;
  }
}

void descartarErrores() {
  if (distanceFrontal > 150) {
    if (discard[0]) {
      distanceFrontal = prevdistanceFrontal;
      discard[0] = false;
    } else {
      discard[0] = true;
    }
  }
  if (distanceTrasero > 150) {
    if (discard[1]) {
      distanceTrasero = prevdistanceTrasero;
      discard[1] = false;
    } else {
      discard[1] = true;
    }
  }
  if (distanceDerecho > 150) {
    if (discard[2]) {
      distanceDerecho = prevdistanceDerecho;
      discard[2] = false;
    } else {
      discard[2] = true;
    }
  }
  if (distanceIzquierdo > 150) {
    if (discard[3]) {
      distanceIzquierdo = prevdistanceIzquierdo;
      discard[3] = false;
    } else {
      discard[3] = true;
    }
  }
  prevdistanceFrontal = distanceFrontal;
  prevdistanceTrasero = distanceTrasero;
  prevdistanceDerecho = distanceDerecho;
  prevdistanceIzquierdo = distanceIzquierdo;
}

void enviar() {
  Serial.print(distanceFrontal);
  Serial.print("; ");
  Serial.print(distanceTrasero);
  Serial.print("; ");
  Serial.print(distanceDerecho);
  Serial.print("; ");
  Serial.println(distanceIzquierdo);
}