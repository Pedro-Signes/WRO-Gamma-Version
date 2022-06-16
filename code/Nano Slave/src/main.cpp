#include <Arduino.h>
#include "components.h"
#include <Ultrasonic.h>
#include <Wire.h>
#include <Adafruit_NeoPixel.h>

#define PinEncoder 2
#define PinTriggerI 3
#define PinEchoI 8
#define PinTriggerD 7
#define PinEchoD 6
#define PinTriggerC 11
#define PinEchoC 4
#define PinLed 12

#define NUMPIXELS 8
#define DELAYVAL 50

volatile long encoder = 0;
bool lecturaEncoder = false;
int vuelta = 1;
float valor = 0;
float offset;
volatile float velocidad;
float face = 0;

CServo MiCServo(PinConServo);
Motor MiMotor(PinEnMotor,PinDir1Motor,PinDir2Motor);
Ultrasonic UltrasonidoI(PinTriggerI, PinEchoI);
Ultrasonic UltrasonidoII(PinTriggerD,PinEchoD);
Adafruit_NeoPixel pixels(NUMPIXELS, PinLed, NEO_GRB + NEO_KHZ400);



void autoTurn(){
  if (UltrasonidoI.read(CM)>60){
    MiCServo.MoverServo(90);
    face = face +90;
  };
  if (UltrasonidoII.read(CM)>60){
    MiCServo.MoverServo(-90);
    face = face -90;
  }
};

void encoderISR() {  // función para que funcien el encoder
  if (forward == true) 
  {
    encoder ++;
  }
  else
  {
    encoder --;
  }
  
}

int ErrorDireccion(int bearing, int target){
  int error = bearing - target;
  if (error == 0) return 0;
  if (error > 180) error -= 360;
  if (error < -180) error += 360;
  return -1*error;
}


void receiveEvent(int howMany);
void requestEvent();

void setup() {
  MiCServo.Setup();
  pinMode(PinEncoder, INPUT);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);

  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event

  Serial.begin(115200);

  pixels.begin();
  delay(100);
  pixels.clear();
  for(int i=0; i<NUMPIXELS; i++) {

    pixels.setPixelColor(i, pixels.Color(255, 255, 255));
  }
  pixels.show();

  MiCServo.MoverServo(ErrorDireccion(valor,0));
  delay(100);
  Serial.println("Configurando interrupciones");
  cli();
  TCCR2A = 0;                 // Reset entire TCCR1A to 0 
  TCCR2B = 0;                 // Reset entire TCCR1B to 0
  TCCR2B |= B00000111;        //Set CS20, CS21 and CS22 to 1 so we get prescalar 1024  
  TIMSK2 |= B00000100;        //Set OCIE1B to 1 so we enable compare match B
  OCR2B = 255;                //Finally we set compare register B to this value 
  sei(); 

  Serial.println("Todo funcionando");
  delay(2000);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.print(velocidad);
  Serial.print(" ");
  Serial.println(MiMotor.GetPotencia());
  MiMotor.corregirVelocidad(velocidad, 20);
  delay(16);
}

void receiveEvent(int howMany) {

}

void requestEvent() {

}

ISR(TIMER2_COMPB_vect){        
  if (lecturaEncoder==true){                  
    velocidad = encoder;
    encoder = 0;
    lecturaEncoder= false;
  }
  else{
    lecturaEncoder=true;
  }
}