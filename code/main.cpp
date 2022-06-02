#include <Arduino.h>
#include <Servo.h>
#include "MPU9250.h"
#include "eeprom_utils.h"
#include <Pixy2.h>
#include <Adafruit_NeoPixel.h>
#include <Ultrasonic.h>

#define servoMAX 67
#define servoMIN 13
#define PinConServo 3
#define PinEnMotor 5
#define PinDir1Motor 6
#define PinDir2Motor 7
#define PinEncoder 2
#define PinLED 11
#define PinTriggerI 8
#define PinEchoI 9
#define kp 3

long encoder = 0;
bool forward = true;
int vuelta = 1;
float valor = 0;
float offset;
float velocidad;
long prev_tiempo = 0;
int incremento_Tiempo = 0;
float face = 0;

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


void encoderISR() {  // función para que funcien el encoder
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

void Motor::arrancar() {  // función para arrancar el motor
  potencia(200);
  if ( encoder >= 200 )
  {
    potencia(140);
  }
  
}

class Ultrasonido{
  public:
  Ultrasonido(byte Trigger, byte Echo);
  long getDistancia();

  private:
  long _distancia = 0;
  byte _Trigger;
  byte _Echo;
};

Ultrasonido::Ultrasonido(byte Trigger, byte Echo){
  _Trigger = Trigger;
  _Echo = Echo;
  pinMode(Trigger, OUTPUT); //pin como salida
  pinMode(Echo, INPUT);  //pin como entrada
}

long Ultrasonido::getDistancia(){
  return _distancia;
}



CServo MiCServo(PinConServo);
Motor MiMotor(PinEnMotor,PinDir1Motor,PinDir2Motor);
MPU9250 mpu;
Pixy2 pixy;
Ultrasonic UltrasonidoI(PinTriggerI, PinEchoI);

void autoTurn(){
  if (UltrasonidoI.read(CM)>60){
    MiCServo.MoverServo(90);
    face = face +90;
  };
};

int ErrorDireccion(int bearing, int target){
  int error = bearing - target;
  if (error == 0) return 0;
  if (error > 180) error -= 360;
  if (error < -180) error += 360;
  return -1*error;
}

void Calibrar(){ // función para calibrar ( revisar )
  mpu.verbose(true);  
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}

void setup() {
  MiCServo.Setup();
  pinMode(PinEncoder, INPUT);
  attachInterrupt(digitalPinToInterrupt(PinEncoder), encoderISR, CHANGE);
  Serial.begin(115200);
  pixy.init();

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
  MiCServo.MoverServo(ErrorDireccion(valor,0));
  delay(100);
  MiMotor.arrancar();
  
}



uint32_t Duracion_de_la_muestra = 0;
/*
void loop()
{ 
  int i; 
  pixy.ccc.getBlocks();
  
  if (pixy.ccc.numBlocks)
  {
    Serial.print("Detected ");
    Serial.println(pixy.ccc.numBlocks);
    for (i=0; i<pixy.ccc.numBlocks; i++)
    {
      Serial.print("  block ");
      Serial.print(i);
      Serial.print(": ");
      pixy.ccc.blocks[i].print();
    }
  }  
}*/

void loop() {
  static uint32_t prev_ms = millis();
    if (mpu.update()) {
        Duracion_de_la_muestra = millis() - prev_ms;
        prev_ms = millis();
        valor = valor + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
    }
    MiCServo.MoverServo(ErrorDireccion(valor,face));
    /*if(encoder > 1500){
      MiCServo.MoverServo(ErrorDireccion(valor,-90*vuelta));
      if(abs(ErrorDireccion(valor,-90*vuelta))<5){
        vuelta ++;
        encoder = 0;
      }
    }*/
    /*
    Serial.println(encoder);
    Serial.println(vuelta);
    Serial.println(valor);
    */
 
         
    static uint32_t prev_ms3 = millis();
            if (millis() > prev_ms3 + 10) {
               //Serial.println(valor);
               //Serial.println(Duracion_de_la_muestra);
               autoTurn();
                prev_ms3 = millis();
        }
    
}

//para probar con los sensores de ultrasonido
/*
const int Trigger = 2;   //Pin digital 2 para el Trigger del sensor
const int Echo = 3;   //Pin digital 3 para el Echo del sensor
void setup() {
  Serial.begin(9600);//iniciailzamos la comunicación
  pinMode(Trigger, OUTPUT); //pin como salida
  pinMode(Echo, INPUT);  //pin como entrada
  digitalWrite(Trigger, LOW);//Inicializamos el pin con 0
}
void loop()
{
  long t; //timepo que demora en llegar el eco
  long d; //distancia en centimetros
  digitalWrite(Trigger, HIGH);
  delayMicroseconds(10);          //Enviamos un pulso de 10us
  digitalWrite(Trigger, LOW);
  
  t = pulseIn(Echo, HIGH); //obtenemos el ancho del pulso
  d = t/59;             //escalamos el tiempo a una distancia en cm
  
  Serial.print("Distancia: ");
  Serial.print(d);      //Enviamos serialmente el valor de la distancia
  Serial.print("cm");
  Serial.println();
  delay(100);          //Hacemos una pausa de 100ms
}
*/
