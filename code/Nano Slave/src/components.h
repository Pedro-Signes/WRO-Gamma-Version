#include <Servo.h>

#define servoMAX 67
#define servoMIN 13

#define PinConServo 9
#define PinEnMotor 11
#define PinDir1Motor 15
#define PinDir2Motor 16

bool forward = true;

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
  void arrancar();

  private:
  byte _pinEn;
  byte _pinDir1;
  byte _pinDir2;
  float _potencia = 0;

};

Motor::Motor(byte PinEn,byte PinDir1,byte PinDir2){ // setup del motor
  _pinEn = PinEn;
  _pinDir1 = PinDir1;
  _pinDir2 = PinDir2;
  pinMode(PinEn, OUTPUT);
  pinMode(PinDir1, OUTPUT);
  pinMode(PinDir2, OUTPUT);

}



void Motor::potencia(int pot){
  // (PinDir1Motor,LOW) ; (PinDir2Motor,HIGH) -> Hacia atrás
  // Inversamente propocional en el tema del sentido
  // Arranrque = 140
  if(forward==true){
    digitalWrite(PinDir1Motor,HIGH);
    digitalWrite(PinDir2Motor,LOW);
    analogWrite(PinEnMotor, pot);
    Serial.print("Motor configurado");
    Serial.println(pot);
  }
  else{
    digitalWrite(PinDir1Motor,LOW);
    digitalWrite(PinDir2Motor,HIGH);
    analogWrite(PinEnMotor, pot);
  }
 
}
/*
void Motor::errorPotencia(float velocidad, float target){
  float error = target - velocidad;
  _potencia = _potencia + error*kp;
  if (_potencia <0) _potencia = 0;
  if (_potencia > 255) _potencia = 255;
  potencia((int)_potencia);
}*/