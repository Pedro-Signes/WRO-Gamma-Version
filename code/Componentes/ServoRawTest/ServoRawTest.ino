#include <Servo.h>

#define servoMAX 180
#define servoMIN 0
#define servoO 90

#define PinConServo 8

Servo Miservo;

void setup() {
  // put your setup code here, to run once:
  Miservo.attach(PinConServo);
  Serial.begin(115200);
  Serial.setTimeout(30000);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
    int _ang = Serial.parseInt();
    if (_ang == 0){}
    else{
    Miservo.write(_ang);
    Serial.write(_ang);}
  }
}
