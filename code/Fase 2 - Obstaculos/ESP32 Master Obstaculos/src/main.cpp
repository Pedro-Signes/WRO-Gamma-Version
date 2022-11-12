#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <Pixy2.h>
#include <ESP32Servo.h>

#define tamanoMinimodeEsquive 55
#define GreenSignature 1
#define RedSignature 2

#define EncodersPorCM 14

#define PIN_BOTON 13

/*
#define PIN_ROJO1 25
#define PIN_VERDE1 26
#define PIN_AZUL1 27
#define PIN_ROJO2 14
#define PIN_VERDE2 12
#define PIN_BOCINA 33
*/

#define PIN_SERVO_CAM 33      // Servo de la camara

#define servoKP 10
#define servoKD 15
int _setAngleAnterior;    // Valor del _setAngle anterior

#define posicionKP 0.75
#define posicionKD 0
int posicionObjetivo = 0;
int ErrorPosicionActual = 0;
int ErrorPosicionAnterior = 0;

float valorBrujula = 0;   // + anti-clockwise | - clockwise
float offset;
int vuelta = 1;
int giros = 0;
bool sentidoGiro = true;      // True -> Izquierda   |   False -> Derecha
bool LecturaGiro = true;

int ErrorDireccionAnterior = 0;
int ErrorDireccionActual = 0;
int direccionObjetivo = 0;

bool GiroRealizado = true;
bool PrimeraParada = true;
bool SegundaParada = true;
bool AutoGiro = true;

uint32_t Duracion_de_la_muestra = 0;

MPU9250 mpu;
Pixy2 pixy;
Servo servo;

long solicitudEncoder();
byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraDerecho = 1;
byte ultraIzquierdo = 2;
byte ultraTrasero = 3;

byte medidasLaseres[3];

long medidaencoder = 0;
long prev_medidaencoder = 0;
long MarcaEncoder = 0;
long MarcaEncoderTramo = -2000;

bool forward = true;

double posicionX = 0;   // 0 en el centro  | + izquierda | - derecha
double posicionY = 0;   // 0 pared trasera | + forward   | - backwards

enum e{
  Inicio,
  Recto,
  DecidiendoGiro,
  Maniobra1, // Girar
  Maniobra2,
  Posicionamiento,
  ComprobacionPosicion,
  Centrar1,
  Centrar2,
  Centrar3,
  Atras,
  Final
};

byte estado;


/*void Calibrar(){ // función para calibrar ( revisar )
  mpu.verbose(true);  
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}*/

// Devuelve la posición donde hay que poner el servo
int ErrorDireccion(int bearing, int target){
  int error = target - bearing;
  return error;
}

// I2C Arduino Nano Slave 1

long medirEncoder() {
  Wire.beginTransmission(4);
  Wire.write(1);
  Wire.endTransmission();
  Wire.requestFrom(4,4);
  long _medidaEncoder;
  byte iteracion = 0;
  while( iteracion < 4){
    _medidaEncoder = _medidaEncoder | Wire.read()<<(8*iteracion);
    iteracion++;
  }
  return _medidaEncoder;
}

void setEnable (int motrorEnable){
  Wire.beginTransmission(4);
  Wire.write(5);
  Wire.write(motrorEnable);
  Wire.endTransmission();
}

void setGiro(int posicionServo){
  Wire.beginTransmission(4);
  Wire.write(4);
 
  if(posicionServo<0){
    Wire.write(-posicionServo);
    Wire.write(0);
  }else{
    Wire.write(posicionServo);
    Wire.write(1);
  }
  Wire.endTransmission();
}

void setVelocidad(int velocidad){
  Wire.beginTransmission(4);
  Wire.write(3);
  if(velocidad<0){
    Wire.write(-velocidad);
    Wire.write(0);
    forward = false;
  }else{
    Wire.write(velocidad);
    Wire.write(2);
    forward = true;
  }
  Wire.endTransmission();
}

void medirUltrasonidos() {
  Wire.beginTransmission(4);
  Wire.write(2);
  Wire.endTransmission();
  Wire.requestFrom(4,4);
  byte iteracion = 0;
  while (Wire.available()) {
    medidasUltrasonidos[iteracion] = Wire.read();
    iteracion ++;
  }
}

// I2C Arduino Nano Every Slave 2

void medirLaseres() {
  Wire.beginTransmission(5);
  Wire.write(1);
  Wire.endTransmission();
  Wire.requestFrom(5,3);
  byte iteracion = 0;
  while (Wire.available()) {
    medidasLaseres[iteracion] = Wire.read();
    iteracion ++;
  }
}

// Telemetria

void enviarMensaje(int numero){
 Serial.println(numero);
}
void enviarMensaje(String texto){
 Serial.println(texto);
}

void posicionTelemetria() {
  Serial.print("\t");
  Serial.print(posicionObjetivo);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(direccionObjetivo);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(posicionX);
  Serial.print(",");
  Serial.print("\t");
  Serial.println(posicionY);
}

void distanceTelemetria() {
Serial.print("\t");
Serial.print(medidasUltrasonidos[ultraFrontal]);
Serial.print("\t");
Serial.print(medidasUltrasonidos[ultraDerecho]);
Serial.print("\t");
Serial.print(medidasUltrasonidos[ultraIzquierdo]);
Serial.print("\t");
Serial.print(medidasUltrasonidos[ultraTrasero]);
Serial.print("\t");
Serial.print(medidasLaseres[ultraFrontal]);
Serial.print("\t");
Serial.print(medidasLaseres[ultraDerecho]);
Serial.print("\t");
Serial.println(medidasLaseres[ultraIzquierdo]);
}

void EnviarTelemetria()
{
  Serial.print("\t");
  Serial.print(estado);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(medidasUltrasonidos[ultraFrontal]);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(medidasUltrasonidos[ultraTrasero]);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(medidasUltrasonidos[ultraDerecho]);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(medidasUltrasonidos[ultraIzquierdo]);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(MarcaEncoder);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(medidaencoder);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(medidaencoder - MarcaEncoder);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(sentidoGiro);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(direccionObjetivo);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(_setAngleAnterior);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(valorBrujula);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(posicionX);
  Serial.print(",");
  Serial.print("\t");
  Serial.print(posicionY);
  Serial.print("\t");
  Serial.println(ErrorDireccionActual);
}

// Obtencion de la posicion

void posicionInicial() {
  medirUltrasonidos();
  if ((medidasUltrasonidos[ultraTrasero] > 90) && (medidasUltrasonidos[ultraTrasero] < 140)){
    posicionY = medidasUltrasonidos[ultraTrasero] * EncodersPorCM;
  } else if ((medidasUltrasonidos[ultraFrontal] > 90) && (medidasUltrasonidos[ultraFrontal] < 140)){
    posicionY = (300 - medidasUltrasonidos[ultraFrontal]) * EncodersPorCM;
  }
  EnviarTelemetria();
}

void resetPosicion(bool corregir) { // Corregir True -> Con ultrasonidos      Corregir False -> Con resta
  if (corregir) {
    if (sentidoGiro) {
      posicionX = (50 - medidasUltrasonidos[ultraDerecho]) * EncodersPorCM;
    } else {
      posicionX = (50 - medidasUltrasonidos[ultraIzquierdo]) * EncodersPorCM;
    }
    posicionY = medidasUltrasonidos[ultraTrasero] * EncodersPorCM;
  } else {
    posicionX = posicionY - 250 * EncodersPorCM;
    posicionY = posicionX + 50 * EncodersPorCM;
  }
}

void posicionamiento() {
  ErrorPosicionAnterior = ErrorPosicionActual;
  ErrorPosicionActual = constrain(ErrorDireccion(posicionX, posicionObjetivo), -85, 85);
  direccionObjetivo = 90*giros + constrain(posicionKP * ErrorPosicionActual + posicionKD * (ErrorPosicionActual - ErrorPosicionAnterior), -85, 85);
}

// angulo € [-90, 90]
void moverCamara(int angulo) {  // 0 == 85 | min == 0 | max == 170
  byte _ang = map(angulo + 90, 0, 180, 0, 170);
  servo.write(constrain(_ang, 0, 170));
}

// Mover el automaticamente el servo de la camara
void autoMoverCamara() {
  int posicionBloqueX = 0;
  int posicionBloqueY = 200 * EncodersPorCM;
  int _ang;
  if (posicionY <= 85 * EncodersPorCM){
    posicionBloqueY = 100 * EncodersPorCM;
  } else if (posicionY <= 135 * EncodersPorCM) {
    posicionBloqueY = 150 * EncodersPorCM;
  } else if (posicionY <= 185 * EncodersPorCM) {
    posicionBloqueY = 200 * EncodersPorCM;
  } if (posicionY >= 195 * EncodersPorCM) {
    posicionBloqueY = 300 * EncodersPorCM;
  }
  _ang = atan2(posicionBloqueX - posicionX, posicionBloqueY - posicionY);
  int _offsetLapAngle = 90 * giros;
  if (!sentidoGiro) _offsetLapAngle = -_offsetLapAngle;
  moverCamara(_ang - valorBrujula - _offsetLapAngle);
}

void setup() {
  pixy.init();
  
  ESP32PWM::allocateTimer(0);
	ESP32PWM::allocateTimer(1);
	ESP32PWM::allocateTimer(2);
	ESP32PWM::allocateTimer(3);
	servo.setPeriodHertz(50);
  servo.attach(PIN_SERVO_CAM);

  servo.write(85);

  Serial.begin(115200);

  pinMode(PIN_BOTON ,INPUT_PULLUP);
  pinMode(LED_BUILTIN,OUTPUT);
  pinMode(LED_BUILTIN,OUTPUT);
  
  /*
  pinMode(PIN_VERDE1,OUTPUT);
  pinMode(PIN_VERDE2,OUTPUT);
  pinMode(PIN_ROJO1,OUTPUT);
  pinMode(PIN_ROJO2,OUTPUT);
  pinMode(PIN_AZUL1,OUTPUT);
  pinMode(PIN_BOCINA,OUTPUT);
  */

  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);

  estado = e::Inicio;

  WiFi.disconnect(true);
  WiFi.mode(WIFI_OFF);
  //Calibrar();

  for(int i = 0; i<20 ; i++){
    digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
    delay(100);
  }
  MPU9250Setting setting;
    setting.accel_fs_sel = ACCEL_FS_SEL::A16G;
    setting.gyro_fs_sel = GYRO_FS_SEL::G2000DPS;
    setting.mag_output_bits = MAG_OUTPUT_BITS::M16BITS;
    setting.fifo_sample_rate = FIFO_SAMPLE_RATE::SMPL_200HZ;
    setting.gyro_fchoice = 0x03;
    setting.gyro_dlpf_cfg = GYRO_DLPF_CFG::DLPF_41HZ;
    setting.accel_fchoice = 0x01;
    setting.accel_dlpf_cfg = ACCEL_DLPF_CFG::DLPF_45HZ;
  while(!mpu.setup(0x68,setting,Wire1)) {  // change to your own address
      //Serial.println("MPU connection failed. Please check your connection with `connection_check` example.");
      delay(1000);
      digitalWrite(LED_BUILTIN,!digitalRead(LED_BUILTIN));
  }

  //loadCalibration();
   
  int num =0;
  float tot =0;
  while (num < 1000){
    if (mpu.update()){
      num = num + 1;
      tot = tot + mpu.getGyroZ();
    }
    delay(5);
  }
  offset = tot/num;

  posicionInicial();

  for( int i = 0; i < 10; i++){
    pixy.changeProg("line");
    delay(100);
  }

  digitalWrite(LED_BUILTIN,HIGH);
  delay(2000);
  while (digitalRead(PIN_BOTON)) {
    medirUltrasonidos();
    medirLaseres();
    //distanceTelemetria();
    //EnviarTelemetria();
    delay(100);
  }
  setEnable(1);
  servo.write(90);
  delay(1000);

  setVelocidad(20);
  delay(500);
}

void loop() {
  static uint32_t prev_ms_brujula = millis();
  if (mpu.update()) {
    Duracion_de_la_muestra = millis() - prev_ms_brujula;
    prev_ms_brujula = millis();
    valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset) * Duracion_de_la_muestra / 1000);
  }

  static uint32_t prev_ms_posicion = millis();
  if (millis() > prev_ms_posicion) {
    if (medidaencoder - prev_medidaencoder) {
      double dy = (medidaencoder - prev_medidaencoder) * cos(valorBrujula * (M_PI/180));
      double dx = (medidaencoder - prev_medidaencoder) * sin(valorBrujula * (M_PI/180));
      prev_medidaencoder = medidaencoder;
      posicionY = posicionY + dy;
      posicionX = posicionX + dx;
      posicionamiento();
    }
    prev_ms_posicion = millis() + 10;
  }

  static uint32_t prev_ms_direccion = millis();
  if (millis() > prev_ms_direccion) {
    ErrorDireccionActual = constrain(ErrorDireccion(valorBrujula, direccionObjetivo),-127,127);
    int _setAngle = constrain(servoKP * ErrorDireccionActual + servoKD * (ErrorDireccionActual - ErrorDireccionAnterior), -255, 255);
    if (_setAngle != _setAngleAnterior) {
      if (AutoGiro) {
        if (forward) {
          setGiro(_setAngle);
        } else {
          setGiro(-_setAngle);
        }
        _setAngleAnterior = _setAngle;
      }
    }
    ErrorDireccionAnterior = ErrorDireccionActual;
    prev_ms_direccion = millis() + 10;    
  }
  
  static uint32_t prev_ms_ultrasonidos = millis();
  if (millis() > prev_ms_ultrasonidos) {
    prev_ms_ultrasonidos = millis() + 20;
    medirUltrasonidos();
    medirLaseres();
    if (!LecturaGiro) {
      pixy.ccc.getBlocks();
      }
  }

  static uint32_t prev_ms_encoder = millis();
  if (millis() > prev_ms_encoder) {
    prev_ms_encoder = millis() + 15;
    medidaencoder = medirEncoder();
  }

  static uint32_t prev_ms_telemetria = millis();
  if (millis() > prev_ms_telemetria) {
    //EnviarTelemetria();
    //distanceTelemetria();
    posicionTelemetria();
    prev_ms_telemetria = millis() + 30;
  }

  static uint32_t prev_ms_camara = millis();
  if (millis() > prev_ms_camara) {
    prev_ms_camara = millis() + 50;
    autoMoverCamara();
  }

  int mayor = -1;
  int tamano = 0;
  
 switch (estado)
  {
  case e::Inicio:
    if (posicionY > 150 * EncodersPorCM) {
      setVelocidad(0);
      estado = e::DecidiendoGiro;
    }
    break;

  case e::Recto:
    AutoGiro = true;
    if ((giros == 12) && ((medidaencoder - MarcaEncoderTramo) >= 800)) {
      estado = e::Final;
    }
    if(pixy.ccc.numBlocks){
      for (int i=0; i < pixy.ccc.numBlocks; i++){
        if(pixy.ccc.blocks[i].m_height > tamano){
          mayor = i;
          tamano = pixy.ccc.blocks[i].m_height;
        }
      }
    }
    if (tamano > tamanoMinimodeEsquive){
      if (pixy.ccc.blocks[mayor].m_signature == RedSignature) {
        posicionObjetivo = -20 * EncodersPorCM;
      } else if (pixy.ccc.blocks[mayor].m_signature == GreenSignature) {
        posicionObjetivo = 20 * EncodersPorCM;
      }
    }
  break;

  case e::DecidiendoGiro:
    if (LecturaGiro) {
      pixy.line.getMainFeatures(LINE_VECTOR);
      delay(100);

      pixy.line.numVectors;
      
      if (pixy.line.numVectors) {
        float x0 = pixy.line.vectors[0].m_x0;
        float y0 = pixy.line.vectors[0].m_y0;
        float x1 = pixy.line.vectors[0].m_x1;
        float y1 = pixy.line.vectors[0].m_y1;
        float m = (y1 - y0) * (x1 - x0);
        if (m < 0) {
          sentidoGiro = false;
        } else if (m > 0) {
          sentidoGiro = true;
        }
        LecturaGiro = false;
        MarcaEncoder = medidaencoder;
        pixy.changeProg("block");
        setVelocidad(20);
        estado = e::Recto;
      }
      delay(100);
    } else {
        estado = e::Maniobra1;
    }
  break;

  case e::Final:
    setVelocidad(0);
    setEnable(0);
  break;


 }
}
