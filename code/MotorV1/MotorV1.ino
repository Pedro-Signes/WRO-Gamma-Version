#define servoMAX 67
#define servoMIN 13
#define PinEnMotor 5
#define PinDir1Motor 6
#define PinDir2Motor 7
#include <Servo.h>
Servo Miservo;

void setup() {
  Miservo.attach(3);
  pinMode(PinEnMotor, OUTPUT);
  pinMode(PinDir1Motor,OUTPUT);
  pinMode(PinDir2Motor,OUTPUT);
  Serial.begin(9600);
  Serial.println("Programa no explota");
  MoverServo(0);
  digitalWrite(PinDir1Motor,LOW);
  digitalWrite(PinDir2Motor,HIGH);
  // (PinDir1Motor,LOW) ; (PinDir2Motor,HIGH) -> Hacia atrás
  analogWrite(PinEnMotor,150);
  delay(1000);
  analogWrite(PinEnMotor,0);
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
