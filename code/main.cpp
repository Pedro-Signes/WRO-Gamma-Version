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
#define interruptPin 2

long encoder = 0;
bool forward = true;
int vuelta = 1;
float valor = 0;

class CServo{  //maneja el servo
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

void CServo::MoverServo(int _angulo){  //lo que mueve el servo 
  int _ang = map(_angulo, -27, 27, servoMIN, servoMAX);
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

void encoderISR() {
  if (forward == true) 
  {
    encoder ++;
  }
  else
  {
    encoder --;
  }
  
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

CServo MiCServo(3);
Motor MiMotor(5,6,7);
MPU9250 mpu;

int ErrorDireccion(int bearing, int target){
  int error = bearing - target;
  if (error == 0) return 0;
  if (error > 180) error -= 360;
  if (error < -180) error += 360;
  return -1*error;
}

void Calibrar(){
  mpu.verbose(true);
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}

float offset;

void setup() {
  encoder = 0;
  MiCServo.Setup();
  pinMode(interruptPin, INPUT);
  attachInterrupt(digitalPinToInterrupt(interruptPin), encoderISR, CHANGE);
  Serial.begin(115200);
  
  //Calibrar();


  Wire.begin();
  
  if (!mpu.setup(0x68)) {  // change to your own address
    while (1) {
      Serial.println("MPU connection failed. Please check your connection with `connection_check` example.");
      delay(5000);
      }
    }

  loadCalibration();

  Serial.println("Programa no explota");
  MiCServo.MoverServo(20);

  int num =0;
  float tot =0;
  while (num < 1000){
    if (mpu.update()){
      num = num +1;
      tot = tot + mpu.getGyroZ();
    }
    delay(5);
  }
  offset = tot/num;
  Serial.println(offset);
  MiCServo.MoverServo(ErrorDireccion(valor,0));
  delay(100);
  MiMotor.potencia(170);
  
}

void print_yaw_gyroz() {
    Serial.print("Yaw, GyroZ: ");
    Serial.print(mpu.getYaw(), 2);
    Serial.print(", ");
    Serial.println(mpu.getGyroZ(), 2);
}






uint32_t Duracion_de_la_muestra = 0;


void loop() {
  static uint32_t prev_ms = millis();
    if (mpu.update()) {
        Duracion_de_la_muestra = millis() - prev_ms;
        prev_ms = millis();
        valor = valor + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
    }

    if(encoder > 1500){

      MiCServo.MoverServo(ErrorDireccion(valor,-90*vuelta));
      if(abs(ErrorDireccion(valor,-90*vuelta))<5){
        vuelta ++;
        encoder = 0;
      }

    }

    Serial.println(encoder);
    Serial.println(vuelta);
    Serial.println(valor);
  
 
         
    static uint32_t prev_ms3 = millis();
            if (millis() > prev_ms3 + 200) {
               //Serial.println(valor);
               //Serial.println(Duracion_de_la_muestra);
                prev_ms3 = millis();
        }

 
    
}


/*
void loop(){
  Serial.print(mpu.getYaw());
  delay(1000);
}
*/
