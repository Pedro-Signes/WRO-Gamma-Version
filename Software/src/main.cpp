#include <Arduino.h>

#define _TIMERINTERRUPT_LOGLEVEL_ 0

#include <ESP32_New_TimerInterrupt.h>

#define PIN_D2 2
#define PIN_D3 3
#define PIN_D4 4

#define PinEnMotor 5
#define PinDir1Motor 6
#define PinDir2Motor 7
#define PinEncoder 2
#define kp 3

unsigned int SWPin = PIN_D4;

#define TIMER0_INTERVAL_MS        1
#define DEBOUNCING_INTERVAL_MS    80

#define LOCAL_DEBUG               1

long encoder = 0;
bool forward = true;
float velocidad;
long prev_tiempo = 0;
int incremento_Tiempo = 0;
float face = 0;


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


void encoderISR() {  // función para que funcione el encoder
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




Motor MiMotor(PinEnMotor,PinDir1Motor,PinDir2Motor);
ESP32Timer ITimer0(0);

volatile unsigned long rotationTime = 0;

float RPM       = 0;
float avgRPM    = 0;

volatile int debounceCounter;

bool IRAM_ATTR TimerHandler0(void * timerNo)
{ 
  if ( !digitalRead(SWPin) && (debounceCounter >= DEBOUNCING_INTERVAL_MS / TIMER0_INTERVAL_MS ) )
  {
    //min time between pulses has passed
    // Using float calculation / vars in core v2.0.0 and core v2.0.1 will cause crash
    // Not using float => using RPM = 100 * real RPM
    RPM = ( 6000000 / ( rotationTime * TIMER0_INTERVAL_MS ) );

    avgRPM = ( 2 * avgRPM + RPM) / 3;

    rotationTime = 0;
    debounceCounter = 0;
  }
  else
  {
    debounceCounter++;
  }

  //if (rotationTime >= 5000)
  if (rotationTime >= 1000)
  {
    // If idle, set RPM to 0, don't increase rotationTime
    RPM = 0;

    avgRPM = ( avgRPM + 3 * RPM) / 4;
     
    rotationTime = 0;
  }
  else
  {
    rotationTime++;
  }

  return true;
}

void setup() {
  pinMode(PinEncoder, INPUT);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);
  Serial.begin(115200);

  pinMode(SWPin, INPUT_PULLUP);
  

  delay(100);
  
  Serial.print(F("\nStarting RPM_Measure on ")); Serial.println(ARDUINO_BOARD);
  Serial.println(ESP32_NEW_TIMERINTERRUPT_VERSION);
  Serial.print(F("CPU Frequency = ")); Serial.print(F_CPU / 1000000); Serial.println(F(" MHz"));

  // Interval in microsecs
  if (ITimer0.attachInterruptInterval(TIMER0_INTERVAL_MS * 1000, TimerHandler0))
  {
    Serial.print(F("Starting  ITimer0 OK, millis() = ")); Serial.println(millis());
  }
  else
    Serial.println(F("Can't set ITimer0. Select another freq. or timer"));

  Serial.flush();   

  delay(100);
  
  
}


void loop() {
  {
  if (avgRPM > 0)
  {
    Serial.print(F("RPM  = ")); Serial.print((float) RPM / 100.f); Serial.print(F(", avgRPM  = ")); Serial.println((float) avgRPM / 100.f);
  }

  delay(1000);
}    
}
