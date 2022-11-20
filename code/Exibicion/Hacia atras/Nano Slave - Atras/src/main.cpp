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

#define NUMPIXELS 9
#define DELAYVAL 50

#define SETUP true
#define LOOP false

volatile long encoder = 0;
volatile long encoderAbsoluto = 0;
bool lecturaEncoder = false;
volatile float velocidad;
byte datoEncoder[4];

int distanceFrontal;
int distanceDerecho;
int distanceIzquierdo;
int distanceTrasero;
int prevdistanceFrontal;
int prevdistanceDerecho;
int prevdistanceIzquierdo;
int prevdistanceTrasero;
byte UltraMedir = 0;

int velocidadObjetivo = 0;

bool ESP_prepared = false;

void receiveEvent(int howMany);
void requestEvent();
uint8_t requestedData = 0;

CServo MiCServo(PinConServo);
Motor MiMotor(PinEnMotor,PinDir2Motor,PinDir1Motor);
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

void colors(byte mainPixel, byte currentPixel, int sense) {
  if (mainPixel == currentPixel) {
    pixels.setPixelColor(currentPixel, pixels.Color(15,0,0));
  } 
  else if (((currentPixel - mainPixel) * sense) == -1) {
    pixels.setPixelColor(currentPixel, pixels.Color(8,0,0));
  } 
  else if (((currentPixel - mainPixel) * sense) == -2) {
    pixels.setPixelColor(currentPixel, pixels.Color(4,0,0));
  } 
  else if (((currentPixel - mainPixel) * sense) == -3) {
    pixels.setPixelColor(currentPixel, pixels.Color(4,0,0));
  } 
  else {
    pixels.setPixelColor(currentPixel, pixels.Color(0,0,0));
  }
}

void colorRotation(bool function) {
  if (function){
    byte mainpixel = 0;
    int sense = 1;
    while (!ESP_prepared) {
      for (int i = 0; i < NUMPIXELS; i++) {
        colors(mainpixel, i, sense);
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
  } else {
    if (!ESP_prepared) {
    static byte mainpixel = 0;
    static int sense = 1;
    for (int i = 0; i < NUMPIXELS; i++) {
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
}

void setWhite() {
  for (int i = 0; i < NUMPIXELS; i++) {
    pixels.setPixelColor(i, pixels.Color(15, 15, 15));
  }
  pixels.show();
}

Ultrasonic ultrasonicFrontal(PinTriggerT,PinEchoT,9000UL);          //Delantero
Ultrasonic ultrasonicIzquierdo(PinTriggerD,PinEchoD,9000UL);        //izquierdo
Ultrasonic ultrasonicDerecho(PinTriggerI,PinEchoI,9000UL);          //derechos
Ultrasonic ultrasonicTrasero(PinTriggerF,PinEchoF,9000UL);          //Trasero

void LecturaUltrasonidos();

void setup() {
  pixels.begin();
  delay(100);
  pixels.clear();
  Serial.begin(115200);
  Serial.println("Serial a punto");

  pinMode(PinEnable,OUTPUT);
  //attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);  //********************************************************************************
  pinMode(PinEncoder, INPUT);

  MiCServo.Setup();
  MiCServo.MoverServo(0);

  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event

  colorRotation(SETUP);

  setWhite();

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
    prev_ms_ultrasonic = millis() + 7;
  }

  static uint32_t prev_ms_speed;
  if (millis() > prev_ms_speed) {
    MiMotor.corregirVelocidad(velocidad, velocidadObjetivo);
    prev_ms_speed = millis() + 15;
  }

  colorRotation(LOOP);
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
      if(valor_enable == 1){
        digitalWrite(PinEnable, HIGH);
        attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);
      }
      //digitalWrite(PinEnable, valor_enable);  //***********************************************************************Esto es lo de antes
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
    Wire.write(datoEncoder, 4);
  }
  else if (requestedData == 2) {
    Wire.write(distanceFrontal);
    Wire.write(distanceDerecho);
    Wire.write(distanceIzquierdo);
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
    if (UltraMedir == 2) {
      UltraMedir = 0;
    } else {
      UltraMedir++;
    }
  } else {
    distanceTrasero = ultrasonicTrasero.read();
  }
}
