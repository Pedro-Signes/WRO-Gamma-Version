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
#define kp 3

long encoder = 0;
long prevEncoder = 0;
int incremento_Encoder = 0;
bool forward = true;
int vuelta = 1;
float valor = 0;
float offset;
float velocidad;
long prev_tiempo = 0;
int incremento_Tiempo = 0;


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
}

void CServo::MoverServo(int _angulo){  //lo que mueve el servo 
  int _ang = map(_angulo, -27, 27, servoMIN, servoMAX);
  Miservo.write(_ang);
}

class Motor{  
  public:
  Motor(byte PinEn,byte PinDir1,byte PinDir2);
  void potencia(int pot);
  void errorPotencia(float bearing, float target);
  int GetPotencia();

  private:
  byte _pinEn;
  byte _pinDir1;
  byte _pinDir2;
  float _potencia = 0;

};
int Motor::GetPotencia(){
  return _potencia;
}

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

void Motor::errorPotencia(float velocidad, float target){
  float error = target - velocidad;
  _potencia = _potencia + error*kp;
  if (_potencia <0) _potencia = 0;
  if (_potencia > 255) _potencia = 255;
  potencia((int)_potencia);
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

void setup() {
  encoder = 0;
  MiCServo.Setup();
  pinMode(interruptPin, INPUT);
  attachInterrupt(digitalPinToInterrupt(interruptPin), encoderISR, CHANGE);
  Serial.begin(115200);
  MiCServo.MoverServo(ErrorDireccion(valor,0));
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
  delay(100);
  //MiMotor.potencia(150);
  
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
/*
    if(encoder > 1500){
//acordarse de multiplicar el 1500 por vuelta para evitar cualquier fallo
      MiCServo.MoverServo(ErrorDireccion(valor,-90*vuelta));
      if(abs(ErrorDireccion(valor,-90*vuelta))<5){
        vuelta ++;
        encoder = 0;
      }

    }

    Serial.println(encoder);
    Serial.println(vuelta);
    Serial.println(valor);
*/  
    static uint32_t prev_ms2 = millis();
            if (millis() > prev_ms2 + 1) {
              incremento_Encoder = encoder - prevEncoder;
              incremento_Tiempo = millis() - prev_tiempo;
              velocidad = (float)incremento_Encoder/(float)incremento_Tiempo;
              prevEncoder = encoder;
              prev_ms2 = millis();
              prev_tiempo = millis();
        }
       
    static uint32_t prev_ms3 = millis();
            if (millis() > prev_ms3 + 200) {
               //Serial.println(valor);
               //Serial.println(Duracion_de_la_muestra);
              //Serial.print(velocidad);
              /*Serial.print(",");
              Serial.print(incremento_Encoder);
              Serial.print(",");
              Serial.println(incremento_Tiempo);*/
              Serial.println(MiMotor.GetPotencia());
              prev_ms3 = millis();
        }
    static uint32_t prev_ms4 = millis();
            if (millis() > prev_ms4 + 5) {
              MiMotor.errorPotencia(velocidad, 2);
              prev_ms4 = millis();
        }

 
    
}