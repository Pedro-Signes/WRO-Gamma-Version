#include <Arduino.h>
#include <Servo.h>
#include "MPU9250.h"
#include "eeprom_utils.h"

#define servoMAX 67
#define servoMIN 13
#define PinConServo 3
#define PinEnMotor 5
#define PinDir1Motor 6
#define PinDir2Motor 7

class CServo{
public:
  CServo(byte PinServo);
  void MoverServo(int _angulo);
  void Setup();
private:
  byte _pinServo;
  Servo Miservo;
};

CServo::CServo(byte PinServo){
  _pinServo = PinServo;
}

void CServo::Setup(){
  Miservo.attach(_pinServo);
  Miservo.write(40);
}

void CServo::MoverServo(int _angulo){
  int _ang = map(_angulo, -27, 27, servoMIN, servoMAX);
  //int _ang =40 - _angulo;
  Miservo.write(_ang);
}

class Motor{
  public:
  Motor(byte PinEn,byte PinDir1,byte PinDir2);
  void potencia(int pot);

  private:
  byte _pinEn;
  byte _pinDir1;
  byte _pinDir2;

};

Motor::Motor(byte PinEn,byte PinDir1,byte PinDir2){
  _pinEn = PinEn;
  _pinDir1 = PinDir1;
  _pinDir2 = PinDir2;
  pinMode(PinEn, OUTPUT);
  pinMode(PinDir1, OUTPUT);
  pinMode(PinDir2, OUTPUT);
  // falta algo?
}

void Motor::potencia(int pot){
  // (PinDir1Motor,LOW) ; (PinDir2Motor,HIGH) -> Hacia atrás
  // Inversamente propocional en el tema del sentido
  // Arranrque = 140
  if(pot >= 0){
    digitalWrite(PinDir1Motor,HIGH);
    digitalWrite(PinDir2Motor,LOW);
    analogWrite(PinEnMotor, pot);
  }
  else{
    digitalWrite(PinDir1Motor,LOW);
    digitalWrite(PinDir2Motor,HIGH);
    analogWrite(PinEnMotor, -1*pot);
  }
 
}

float increaseX(float x0, float x){
  float iX = x - x0;
  return iX;
}

float increaseY(float y0, float y){
  float iY = y - y0;
  return iY;
}

float angle(float x, float y){
  float result;
  result = atan2(y,x);
  return result;
}

CServo MiCServo(3);
Motor MiMotor(5,6,7);
MPU9250 mpu;

float x0 = mpu.getMagX();
float y0 = mpu.getMagY();
float TotAngle;

void setup() {
  MiCServo.Setup();
  Serial.begin(9600);
  
  Wire.begin();
    delay(2000);

    if (!mpu.setup(0x68)) {  // change to your own address
        while (1) {
            Serial.println("MPU connection failed. Please check your connection with `connection_check` example.");
            delay(5000);
        }
    }
  loadCalibration();
  Serial.println("Programa no explota");
  MiCServo.MoverServo(20);
  //MiMotor.potencia(150);
  //delay(1000);
  //MiMotor.potencia(0);
  
}


void loop(){

}

//void loop() {
// if (mpu.update()) {
  //  float temp = mpu.getAccX();
  //  Serial.print("AccX: ");
   // Serial.print(mpu.getAccX(),2);
    //Serial.println(temp);
    //float xVector = mpu.getMagX();
    //float yVector = mpu.getMagY();
    //Serial.print("xVector: ");
    //Serial.print(mpu.getMagX(),2);
    //Serial.println(xVector);
    //float XiVector = increaseX(xVector, x0);
    //float YiVector = increaseX(yVector, y0);
    //float ang = angle(XiVector, YiVector);
    //TotAngle = TotAngle + ang;
    //Serial.print(ang);
    //Serial.println(TotAngle);
    //delay(1000);
  //}
//}



