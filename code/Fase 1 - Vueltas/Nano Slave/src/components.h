#include <Servo.h>

#define servoMAX 119
#define servoMIN 70
#define servo0 90
#define kp 0.3
#define kd 2

#define PinConServo 9
#define PinEnMotor 5
#define PinDir1Motor 16
#define PinDir2Motor 17

bool forward = true;

byte servoMapMAX = (servo0 - servoMIN); 

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
  _angulo = constrain(_angulo, -servoMapMAX, servoMapMAX);
  int _ang = map(_angulo, -servoMapMAX, servoMapMAX, servoMIN, servoMAX);
  Miservo.write(_ang);
}

class Motor{  
  public:
  Motor(byte PinEn,byte PinDir1,byte PinDir2);
  void potencia(int pot);
  void corregirVelocidad(int velocidadActual, int velocidadTarget);
  void arrancar();

  private:
  byte _pinEn;
  byte _pinDir1;
  float GetPotencia();
  byte _pinDir2;
  float _potencia = 0;
  float _error;
  float _errorAnterior;
};

float Motor::GetPotencia(){
  return _potencia;
}

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
  if(pot>=0){
    forward=true;
    digitalWrite(PinDir1Motor,HIGH);
    digitalWrite(PinDir2Motor,LOW);
    analogWrite(PinEnMotor, pot);
  }
  else{
    forward=false;
    digitalWrite(PinDir1Motor,LOW);
    digitalWrite(PinDir2Motor,HIGH);
    analogWrite(PinEnMotor, -pot);
  }
 
}

void Motor::corregirVelocidad(int velocidadActual, int velocidadTarget){
  _error = velocidadTarget - velocidadActual;
  _potencia = constrain( _potencia + _error * kp + (_error - _errorAnterior) * kd, -150, 150);
  _errorAnterior = _error;
  if (velocidadTarget==0){
    potencia(0);
  }else{
  potencia(int(_potencia));}
  
}
