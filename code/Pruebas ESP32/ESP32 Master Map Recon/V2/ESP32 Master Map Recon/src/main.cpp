#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <Pixy2.h>
#include <ESP32Servo.h>

#define cameraWidth 78
#define tamanoMinimodeEsquive 45  //55
#define GreenSignature 1
#define RedSignature 2

#define girosTotales 12

#define EncodersPorCM 14

#define PIN_BOTON 13

#define OffsetMuroInterior 5
#define OffsetMuroExterior 5

#define PIN_SERVO_CAM 33      // Servo de la camara

#define servoKP 1.5
#define servoKD 0
int _setAngleAnterior;    // Valor del _setAngle anterior

#define posicionKP 0.8
#define posicionKD 30
int posicionObjetivo = 0;
int ErrorPosicionActual = 0;
int ErrorPosicionAnterior = 0;

float valorBrujula = 0;   // + anti-clockwise | - clockwise
float offset;
int giros = 0;
bool sentidoGiro = true;      // True -> Izquierda   |   False -> Derecha
bool LecturaGiro = true;

int ErrorDireccionAnterior = 0;
int ErrorDireccionActual = 0;
int direccionObjetivo = 0;

uint32_t Duracion_de_la_muestra = 0;

MPU9250 mpu;
Pixy2 pixy;
Servo servo;

byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraDerecho = 1;
byte ultraIzquierdo = 2;
byte ultraTrasero = 3;

byte medidasLaseres[3];

long medidaencoder = 0;
long prev_medidaencoder = 0;
long MarcaEncoder = 0;

bool forward = true;

double posicionX = 0;   // 0 en el centro  | + izquierda | - derecha
double posicionY = 0;   // 0 pared trasera | + forward   | - backwards
bool corregirX = false; // Al inicio no se corrige

// Estados

enum e{
  // First lap
  Inicio,
  Recto,
  DecidiendoGiro,
  Final,
  // Paths
  Straight,
  Curve1,
  Curve2
};

byte estado;

// Map Saving

int Map[4][2][3];
byte BlockNumber[4] = {0, 0, 0, 0};
long blockDistance = 0;
int8_t tramo = -1;
bool MapScaned = false;

byte nextBlock(byte _tramo) {
  if (!BlockNumber[_tramo]) {
    return 0;
  } else {
    return 1;
  }
}

int firstBlock[3];

void saveFirstBlock(int8_t _bloque) {
  if (pixy.ccc.blocks[_bloque].m_signature == RedSignature) {
    firstBlock[2] = RedSignature;
  } else if(pixy.ccc.blocks[_bloque].m_signature == GreenSignature) {
    firstBlock[2] = GreenSignature;
  }
  if (pixy.ccc.blocks[_bloque].m_x > cameraWidth / 2) {        // Si el bloque está a la derecha
    firstBlock[1] = 1;
  } else {                                                // Si está a la izquierda
    firstBlock[1] = 0;
  }
  firstBlock[0] = blockDistance;
  Serial.print(firstBlock[0]);
  Serial.print(firstBlock[1]);
  Serial.print(firstBlock[2]);
}

void swapFirstBlock() {
  for (byte i = 0; i < 3; i++) {
    Map[3][nextBlock(3)][i] = firstBlock[i];
  }
}

void saveBlock(int8_t _bloque, int8_t _tramo) {
  if (pixy.ccc.blocks[_bloque].m_signature == RedSignature) {
    Map[_tramo][nextBlock(_tramo)][2] = RedSignature;
  } else if(pixy.ccc.blocks[_bloque].m_signature == GreenSignature) {
    Map[_tramo][nextBlock(_tramo)][2] = GreenSignature;
  }
  if (pixy.ccc.blocks[_bloque].m_x > cameraWidth/2) {        // Si el bloque está a la derecha
    Map[_tramo][nextBlock(_tramo)][1] = 1;
  } else {                                                // Si está a la izquierda
    Map[_tramo][nextBlock(_tramo)][1] = 0;
  }
  Map[_tramo][nextBlock(_tramo)][0] = blockDistance;
  Serial.print(Map[_tramo][nextBlock(_tramo)][0]);
  Serial.print(Map[_tramo][nextBlock(_tramo)][1]);
  Serial.print(Map[_tramo][nextBlock(_tramo)][2]);
  BlockNumber[tramo] ++;
}

// Map loading
byte Route[4];
bool tramoDerecha[4];     // Si hay que hacer el tramo por la derecha (true) o por la izquierda (false)

void routeDecision() {
  for (byte _tramo = 0; _tramo < 4; _tramo++){
    if (Map[_tramo][0][2] == RedSignature) {                          // Si el bloque es rojo
      Route[_tramo] = e::Straight;
      tramoDerecha[_tramo] = true;
      if (Map[_tramo][1][2] = GreenSignature) {
        Route[_tramo] = e::Curve1;
      }
    } else if (Map[_tramo][0][2] == GreenSignature) {                        // Si el bloque es verde
      Route[_tramo] = e::Straight;
      tramoDerecha[_tramo] = false;
      if (Map[_tramo][1][2] = RedSignature) {
        Route[_tramo] = e::Curve1;
      }
    }
  }
}

/*void Calibrar(){ // función para calibrar ( revisar )
  mpu.verbose(true);  
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}*/

// Devuelve la posición donde hay que poner el servo
int ErrorDireccion(int bearing, int target) {
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

void medirLaseres();
void distanceTelemetria();

void MantenimientoSensores(){
  while(true){
    Wire.beginTransmission(4);
    Wire.write(6);
    Wire.endTransmission();
    Wire.requestFrom(4,4);
    byte iteracion = 0;
    while (Wire.available()) {
      medidasUltrasonidos[iteracion] = Wire.read();
      iteracion ++;
    }
    medirLaseres();
    distanceTelemetria();
    delay(100);
  }
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

void setEnable(int motrorEnable){
  Wire.beginTransmission(4);
  Wire.write(5);
  Wire.write(motrorEnable);
  Wire.endTransmission();
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
    posicionY = 100 * EncodersPorCM;
  } else if ((medidasUltrasonidos[ultraFrontal] > 90) && (medidasUltrasonidos[ultraFrontal] < 140)){
    posicionY = 160 * EncodersPorCM;
  }
  posicionY = 100 * EncodersPorCM; //aaaaaatenccccciiiiooon, borar cuando el sensor funcione
  EnviarTelemetria();
}

void resetPosicion(bool corregir) { // Corregir True -> Con ultrasonidos      Corregir False -> Con operaciones
  if (corregir) {
    if (sentidoGiro) {
      posicionX = (50 - medidasUltrasonidos[ultraDerecho]) * EncodersPorCM;
    } else {
      posicionX = (50 - medidasUltrasonidos[ultraIzquierdo]) * EncodersPorCM;
    }
    posicionY = medidasUltrasonidos[ultraTrasero] * EncodersPorCM;
  } else {
    double _posX = posicionX;
    posicionX = 250 * EncodersPorCM - posicionY - 10 * EncodersPorCM;
    if (sentidoGiro) {
      posicionY = _posX + 50 * EncodersPorCM;
    } else {
      posicionX = -posicionX;
      posicionY = -_posX + 50 * EncodersPorCM;
    }
    posicionObjetivo = -10;
    if (MapScaned) {
      estado = Route[tramo % 4];
      }
  }
}

void checkGiro() {
  if (sentidoGiro) {
    if ((posicionY >= 170 * EncodersPorCM) && (posicionX >= 0)) {
      giros ++;
      tramo ++;
      resetPosicion(false);
      corregirX = true;
    } else if ((posicionY >= 195 * EncodersPorCM) && (posicionX <= 0)) {
      giros ++;
      tramo ++;
      resetPosicion(false);
      corregirX = true;
    }
  } else {
    if ((posicionY >= 170 * EncodersPorCM) && (posicionX <= 0)) {
      giros --;
      tramo ++;
      resetPosicion(false);
      corregirX = true;
    } else if ((posicionY >= 195 * EncodersPorCM) && (posicionX >= 0)) {
      giros --;
      tramo ++;
      resetPosicion(false);
      corregirX = true;
    }
  }
}

void corregirPosicion() {
  if ((posicionY >= 125 * EncodersPorCM) && corregirX) {  // Para corregir posicion X en mitad de la recta
    if (sentidoGiro) {
      if (posicionX > 0) {
        posicionX = 53 * EncodersPorCM - medidasLaseres[ultraIzquierdo] * EncodersPorCM + OffsetMuroExterior * EncodersPorCM;
      } else {
        posicionX = medidasLaseres[ultraDerecho] * EncodersPorCM - 53 * EncodersPorCM + OffsetMuroExterior * EncodersPorCM;
      }
    } else {
      if (posicionX < 0) {
        posicionX = 53 * EncodersPorCM - medidasLaseres[ultraIzquierdo] * EncodersPorCM + OffsetMuroExterior * EncodersPorCM;
      } else {
        posicionX = medidasLaseres[ultraDerecho] * EncodersPorCM - 53 * EncodersPorCM + OffsetMuroExterior * EncodersPorCM;
      }
    }
    corregirX = false;
  }
}

void posicionamiento() {
  ErrorPosicionAnterior = ErrorPosicionActual;
  ErrorPosicionActual = ErrorDireccion(posicionX, posicionObjetivo);
  if (posicionY <= 95 * EncodersPorCM) {
    direccionObjetivo = constrain(posicionKP * ErrorPosicionActual + posicionKD * (ErrorPosicionActual - ErrorPosicionAnterior), -95, 95);
  } else {
    direccionObjetivo = constrain(posicionKP * ErrorPosicionActual + posicionKD * (ErrorPosicionActual - ErrorPosicionAnterior), -85, 85);
  }
}

// Camara

// angulo € [-90, 90]
void moverCamara(int angulo) {  // 0 == 85 | min == 0 | max == 170
  byte _ang = map(angulo + 90, 0, 180, 0, 170);
  servo.write(constrain(_ang, 0, 170));
}

// Mover el automaticamente el servo de la camara
void autoMoverCamara() {
  double posicionBloqueX = 0;
  double posicionBloqueY = 200 * EncodersPorCM;
  int _ang;
  if (posicionY <= 75 * EncodersPorCM){
    posicionBloqueY = 80 * EncodersPorCM;
  } else if (posicionY <= 125 * EncodersPorCM) {
    posicionBloqueY = 130 * EncodersPorCM;
  } else if (posicionY <= 175 * EncodersPorCM) {
    posicionBloqueY = 180 * EncodersPorCM;
  }
  _ang = 180 / M_PI * atan2(posicionBloqueX - posicionX, posicionBloqueY - posicionY);
  int _offsetLapAngle = 90 * giros;
  moverCamara(_ang - valorBrujula + _offsetLapAngle);
}

// Comienzo del programa

void setup() {
  delay(500);

  pixy.init();
  
  ESP32PWM::allocateTimer(0); // Iniciar timers del PWM
	ESP32PWM::allocateTimer(1);
	ESP32PWM::allocateTimer(2);
	ESP32PWM::allocateTimer(3);
	servo.setPeriodHertz(50);
  servo.attach(PIN_SERVO_CAM);
  moverCamara(0);

  Serial.begin(115200);

  pinMode(PIN_BOTON ,INPUT_PULLUP);
  pinMode(LED_BUILTIN,OUTPUT);
  pinMode(LED_BUILTIN,OUTPUT);

  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);

  //MantenimientoSensores();

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

  for (int i = 0; i < 10; i++) {
    pixy.changeProg("line");
    delay(100);
  }

  delay(1000);
  digitalWrite(LED_BUILTIN,HIGH);

  while (digitalRead(PIN_BOTON)) {
    medirUltrasonidos();
    medirLaseres();
    //distanceTelemetria();
    //EnviarTelemetria();
    delay(100);
  }

  setEnable(1);
  delay(1000);

  setVelocidad(30);
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
    medidaencoder = medirEncoder();
    if (medidaencoder != prev_medidaencoder) {
      double dy = (medidaencoder - prev_medidaencoder) * cos((valorBrujula - 90 * giros) * (M_PI/180));
      double dx = (medidaencoder - prev_medidaencoder) * sin((valorBrujula - 90 * giros) * (M_PI/180));
      prev_medidaencoder = medidaencoder;
      posicionY = posicionY + dy;
      posicionX = posicionX + dx;
      posicionamiento();
    }
    prev_ms_posicion = millis() + 10;
  }


  static uint32_t prev_ms_direccion = millis();
  if (millis() > prev_ms_direccion) {
    ErrorDireccionActual = constrain(ErrorDireccion(valorBrujula - 90 * giros, direccionObjetivo), -127, 127);
    int _setAngle = constrain(servoKP * ErrorDireccionActual + servoKD * (ErrorDireccionActual - ErrorDireccionAnterior), -255, 255);
    if (_setAngle != _setAngleAnterior) {
      if (forward) {
        setGiro(_setAngle);
      } else {
        setGiro(-_setAngle);
      }
      _setAngleAnterior = _setAngle;
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
      checkGiro();
    }
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

  int8_t mayor = -1;
  int tamano = 0;
  
 switch (estado)
  {
  case e::Inicio:
    if (posicionY > 160 * EncodersPorCM) { 
      setVelocidad(0);
      estado = e::DecidiendoGiro;
    }
    break;

  case e::Recto:
    if ((giros == 4) && (posicionY >= 140 * EncodersPorCM)) {
      if (firstBlock[2] == RedSignature) {
        posicionObjetivo = -25 * EncodersPorCM;
      } else if (firstBlock[2] == GreenSignature) {
        posicionObjetivo = 25 * EncodersPorCM;
      }
      swapFirstBlock();
      MapScaned = true;
    }
    if (pixy.ccc.numBlocks) {
      for (int i=0; i < pixy.ccc.numBlocks; i++) {
        if (pixy.ccc.blocks[i].m_height > tamano) {
          mayor = i;
          tamano = pixy.ccc.blocks[i].m_height;
        }
      }
    }
    if (tamano > tamanoMinimodeEsquive) {
      if (pixy.ccc.blocks[mayor].m_signature == RedSignature) {
        posicionObjetivo = -25 * EncodersPorCM;
      } else if (pixy.ccc.blocks[mayor].m_signature == GreenSignature) {
        posicionObjetivo = 25 * EncodersPorCM;
      }
      if (tramo == -1) {
        saveFirstBlock(mayor);
      } else {
        saveBlock(mayor, tramo);
      }
    }
  break;

  case e::DecidiendoGiro:
    pixy.line.getMainFeatures(LINE_VECTOR);
    delay(100);

    pixy.line.numVectors;
    
    if (pixy.line.numVectors) {
      int x0 = pixy.line.vectors[0].m_x0;
      int y0 = pixy.line.vectors[0].m_y0;
      int x1 = pixy.line.vectors[0].m_x1;
      int y1 = pixy.line.vectors[0].m_y1;
      long m = (y1 - y0) * (x1 - x0);
      if (m > 0) {
        sentidoGiro = false;
        Serial.println("Sentido false");
      } else if (m < 0) {
        sentidoGiro = true;
        Serial.println("Sentido true");
      }
      LecturaGiro = false;
      pixy.changeProg("block");
      setVelocidad(20);
      estado = e::Recto;
    }
  break;

  case e::Final:
    setVelocidad(0);
    setEnable(0);
  break;

  case e::Straight:
    if ((abs(giros) == girosTotales) && (posicionY >= 120 * EncodersPorCM)) {
      estado = e::Final;
    } else {
      if (tramoDerecha[tramo]) {
        posicionObjetivo = -25 * EncodersPorCM;
      } else {
        posicionObjetivo = 25 * EncodersPorCM;
      }
    }
  break;

  case e::Curve1:
    if ((abs(giros) == girosTotales) && (posicionY >= 120 * EncodersPorCM)) {
      estado = e::Final;
    } else {
      if (tramoDerecha[tramo]) {
        posicionObjetivo = -25 * EncodersPorCM;
      } else {
        posicionObjetivo = 25 * EncodersPorCM;
      }
      estado = e::Curve2;
    }
  break;

  case e::Curve2:
    if (posicionY >= 130) {
      if (tramoDerecha[tramo]) {
        posicionObjetivo = 25 * EncodersPorCM;
      } else {
        posicionObjetivo = -25 * EncodersPorCM;
      }
    }
  break;

 }

}