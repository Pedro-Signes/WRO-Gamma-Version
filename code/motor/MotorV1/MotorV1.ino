#define servoMAX 67
#define servoMIN 13
#define Mitad (servoMAX + servoMIN)/2
#include <Servo.h>
Servo Miservo;

void setup() {
  Miservo.attach(3);
  Serial.begin(9600);
  Serial.println("Programa no explota");
  MoverServo(0);
}

int Recibido=0;
int Angulo=0;

void loop() {
 Recibido = Serial.parseInt();
 if (Recibido != 0){
  Serial.println("Angulo optenido");
  Serial.println(Recibido);
  Angulo = MoverServo(Recibido);
  Serial.println(Angulo);
 }

 
}
int MoverServo(int _angulo){ 
 Miservo.write(40 - _angulo);
 return (40 - _angulo);
}
