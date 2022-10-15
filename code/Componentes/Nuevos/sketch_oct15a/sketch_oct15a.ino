#define kp 0.3
#define kd 2

#define PinEnMotor 5
#define PinDir1Motor 16
#define PinDir2Motor 17
#define PinEnable 14

#define PinEncoder 2

bool forward = true;

volatile long encoder = 0;
volatile long encoderAbsoluto = 0;

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

void encoderISR() {  // función para que funcien el encoder
  if (forward == true) 
  {
    encoder ++;
    encoderAbsoluto++;
  }
  else
  {
    encoder --;
    encoderAbsoluto--;
  }
  
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  Motor MiMototor(PinEnMotor, PinDir1Motor, PinDir2Motor);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);
  pinMode(PinEncoder, INPUT);
  pinMode(PinEnable,OUTPUT);
  digitalWrite(PinEnable, true);
  MiMototor.potencia(40);
}

static uint32_t prevms = millis();

void loop() {
  // put your main code here, to run repeatedly:
  if(millis() > prevms+30)
  {
    Serial.print(encoder);
    encoder = 0;
    Serial.print(" ; ");
    Serial.println(encoderAbsoluto);
    prevms = millis();
  }

}
