#include <Servo.h>

#define servoMAX 180
#define servoMIN 0
#define servoO 90

#define PinConServo 7

class CServo { //maneja el servo
  public:
    CServo(byte PinServo);
    void MoverServo(int _angulo);
    void Setup();
  private:
    byte _pinServo;
    Servo Miservo;
};

CServo::CServo(byte PinServo) {
  _pinServo = PinServo;
}

void CServo::Setup() {
  Miservo.attach(_pinServo);
}

void CServo::MoverServo(int _angulo) { //lo que mueve el servo
  _angulo = constrain(_angulo, 0, 180);
  int _ang = map(_angulo, 0, 180, servoMIN, servoMAX);
  Miservo.write(_ang);
}

CServo MiServo(PinConServo);

void setup() {
  // put your setup code here, to run once:
  MiServo.Setup();
  Serial.begin(115200);
  Serial.setTimeout(30000);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
    int _ang = Serial.parseInt();
    if (_ang == 0){}
    else{
    MiServo.MoverServo(_ang);
    Serial.write(_ang);}
  }
}
