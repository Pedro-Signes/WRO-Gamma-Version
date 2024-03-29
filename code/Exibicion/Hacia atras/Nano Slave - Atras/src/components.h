#include <Servo.h>

#define servoMAX 119
#define servoMIN 70
#define servo0 95
#define kp 0.3
#define kd 2

#define PinConServo 9
#define PinEnMotor 5
#define PinDir1Motor 16
#define PinDir2Motor 17

bool forward = true;

class CServo{  //maneja el servo
public:
  CServo(byte PinServo);
  void MoverServo(int _angulo);
  void Setup();
  int getAngle();
private:
  byte _pinServo;
  int _ang = 0;
  Servo Miservo;
};

CServo::CServo(byte PinServo){
  _pinServo = PinServo;
}

void CServo::Setup(){
  Miservo.attach(_pinServo);
}

void CServo::MoverServo(int _angulo){  //lo que mueve el servo 
  _ang = _ang;
  _ang = map(_angulo, -100, 100, servoMIN, servoMAX);
  _ang = constrain(_ang, servoMIN, servoMAX);
  Miservo.write(_ang);
}

int CServo::getAngle() {
  return _ang;
}

class Motor{  
  public:
  Motor(byte PinEn,byte PinDir1,byte PinDir2);
  void potencia(int pot);
  void corregirVelocidad(int velocidadActual, int velocidadTarget);
  void arrancar();
  float GetPotencia();

  private:
  byte _pinEn;
  byte _pinDir1;
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
  // (_pinDir1, LOW) ; (_pinDir2, HIGH) -> Hacia atrás
  // Inversamente propocional en el tema del sentido
  // Arranrque = 140
  if(pot>0){
    forward = true;
    digitalWrite(_pinDir1,HIGH);
    digitalWrite(_pinDir2,LOW);
    analogWrite(_pinEn, pot);
  }
  else if(pot < 0){
    forward = false;
    digitalWrite(_pinDir1,LOW);
    digitalWrite(_pinDir2,HIGH);
    analogWrite(_pinEn, -pot);
  }else{
    digitalWrite(_pinDir1,LOW);
    digitalWrite(_pinDir2,LOW);
    analogWrite(_pinEn,200);
  }
 
}

void Motor::corregirVelocidad(int velocidadActual, int velocidadTarget){
  _error = velocidadTarget - velocidadActual;
  _potencia = constrain( _potencia + _error * kp + (_error - _errorAnterior) * kd, -150, 150);
  _errorAnterior = _error;
  if (velocidadTarget==0){
    potencia(0);
  }else{
    potencia(int(_potencia))
  ;}
  
}
