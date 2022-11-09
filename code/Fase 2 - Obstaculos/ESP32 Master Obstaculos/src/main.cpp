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

#define PIN_ROJO1 25
#define PIN_VERDE1 26
#define PIN_AZUL1 27
#define PIN_ROJO2 14
#define PIN_VERDE2 12
//#define PIN_BOCINA 33

#define PIN_SERVO_CAM 33      // Servo de la camara

#define servoKP 10
#define servoKD 15
int _setAngleAnterior;    // Valor del _setAngle anterior

float valorBrujula = 0;
float offset;
int vuelta = 1;
int giros = 0;
bool sentidoGiro = true;      // True -> Izquierda      False -> Derecha
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

bool esquivarDerecha = false;

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

double posicionX = 0;
double posicionY = 0;

enum e{
  Inicio,
  Recto,
  Esquivar1, // Esquivar Bloques
  Esquivar2,
  Esquivar3,
  Esquivar4,
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

void posicionamiento(bool corregir) { // Corregir True -> Con ultrasonidos      Corregir False -> Con resta
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

void setup() {
  pixy.init();
  
  ESP32PWM::allocateTimer(0);
	ESP32PWM::allocateTimer(1);
	ESP32PWM::allocateTimer(2);
	ESP32PWM::allocateTimer(3);
	servo.setPeriodHertz(50);
  servo.attach(PIN_SERVO_CAM);

  Serial.begin(115200);

  pinMode(PIN_BOTON ,INPUT_PULLUP);
  pinMode(LED_BUILTIN,OUTPUT);
  pinMode(LED_BUILTIN,OUTPUT);
  
  pinMode(PIN_VERDE1,OUTPUT);
  pinMode(PIN_VERDE2,OUTPUT);
  pinMode(PIN_ROJO1,OUTPUT);
  pinMode(PIN_ROJO2,OUTPUT);
  pinMode(PIN_AZUL1,OUTPUT);
  //pinMode(PIN_BOCINA,OUTPUT);

  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);

  estado = e::Final;

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
    //pixy.changeProg("line");
    Serial.println(pixy.changeProg("line"));
    delay(100);
  }

  digitalWrite(LED_BUILTIN,HIGH);
  digitalWrite(PIN_AZUL1, HIGH);
  delay(2000);
  while (digitalRead(PIN_BOTON)){
    medirUltrasonidos();
    medirLaseres();
    distanceTelemetria();
    //EnviarTelemetria();
    delay(100);
  }
  digitalWrite(PIN_AZUL1, LOW);
  setEnable(1);
  delay(1000);

  Serial.println("Servo va a moverse");

  servo.write(30);
  delay(300);
  servo.write(120);
  delay(300);
  servo.write(30);
  delay(300);
  servo.write(120);
  delay(300);
  servo.write(30);
  delay(300);
  servo.write(120);
  delay(300);

  Serial.println("ya ta");

  //setVelocidad(20);
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
    double dx = (medidaencoder - prev_medidaencoder) * sin(valorBrujula * (M_PI/180));
    double dy = (medidaencoder - prev_medidaencoder) * cos(valorBrujula * (M_PI/180));
    posicionX = posicionX + dx;
    posicionY = posicionY + dy;
    prev_ms_posicion = millis() + 10;
  }

  static uint32_t prev_ms_direccion = millis();
  if (millis() > prev_ms_direccion) {
    ErrorDireccionActual = constrain(ErrorDireccion(valorBrujula, direccionObjetivo),-127,127);
    int _setAngle = constrain(servoKP * ErrorDireccionActual + servoKD * (ErrorDireccionActual - ErrorDireccionAnterior), -255, 255);
    if(_setAngle != _setAngleAnterior) {
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
  if (millis()> prev_ms_ultrasonidos) {
    prev_ms_ultrasonidos = millis() + 20;
    medirUltrasonidos();
    if (!LecturaGiro) {
      pixy.ccc.getBlocks();
      }
  }

  static uint32_t prev_ms_encoder = millis();
  if (millis()> prev_ms_encoder) {
    prev_ms_encoder = millis() + 30;
    prev_medidaencoder = medidaencoder;
    medidaencoder = medirEncoder();
    //EnviarTelemetria();
    distanceTelemetria();
  }

  int mayor = -1;
  int tamano = 0;
  
 switch (estado)
  {
  case e::Inicio:
    if (posicionY > 2500) {
      setVelocidad(0);
      estado = e::DecidiendoGiro;
    }
    break;

  case e::Recto:
    digitalWrite(PIN_ROJO1, LOW);
    digitalWrite(PIN_VERDE1, LOW);
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
      setVelocidad(0);
      delay(50);
      if (pixy.ccc.blocks[mayor].m_signature == RedSignature) {
        esquivarDerecha = true;
        digitalWrite(PIN_ROJO1, HIGH);
        direccionObjetivo = direccionObjetivo - 80;
      } else if(pixy.ccc.blocks[mayor].m_signature == GreenSignature){
        esquivarDerecha = false;
        digitalWrite(PIN_VERDE1, HIGH);
        direccionObjetivo = direccionObjetivo + 80;
      }
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      setVelocidad(20);
      estado = e::Esquivar1;
    }
    if ((medidasUltrasonidos[ultraFrontal] <= 20) && ((medidaencoder - MarcaEncoderTramo) >= 1200)){
      estado = e::DecidiendoGiro;
    } else if (medidasUltrasonidos[ultraFrontal] <= 15){
      setVelocidad(0);
      MarcaEncoder = medidaencoder;
      setVelocidad(-20);
      estado = e::Atras;
    }
  break;

  case e::DecidiendoGiro:
    if (LecturaGiro){
      pixy.line.getMainFeatures(LINE_VECTOR);
      delay(100);

      pixy.line.numVectors;
      
      if (pixy.line.numVectors){
        float x0 = pixy.line.vectors[0].m_x0;
        float y0 = pixy.line.vectors[0].m_y0;
        float x1 = pixy.line.vectors[0].m_x1;
        float y1 = pixy.line.vectors[0].m_y1;
        float m = (y1 - y0)*(x1 - x0);
        if (m < 0){
          sentidoGiro = false;
        } else if(m > 0){
          sentidoGiro = true;
        }
        LecturaGiro = false;
        MarcaEncoder = medidaencoder;
        setVelocidad(-20);
        pixy.changeProg("block");
        estado = e::Atras;
      }
      delay(100);
    } else {
        setVelocidad(0);
        delay(20);
        estado = e::Maniobra1;
    }
  break;

  case e::Atras:
    if ((MarcaEncoder - medidaencoder) >= 250){
      setVelocidad(0);
      delay(20);
      setVelocidad(20);
      estado = e::Recto;
    }
  break;

  case e::Final:
    setVelocidad(0);
    setEnable(0);
  break;

  case e::Esquivar1:
    if (abs(posicionX) >= 280) {
      digitalWrite(PIN_AZUL1, HIGH);
      estado = e::Final;
    }
  break;

/*
  case e::Esquivar1:
    if (abs(ErrorDireccionActual) <= 5){
      estado = e::Final;
    }
  break;*/

  case e::Esquivar2:
    if (abs(ErrorDireccionActual) <= 5) {
      if (esquivarDerecha) {
        direccionObjetivo = direccionObjetivo + 80;
      } else {
        direccionObjetivo = direccionObjetivo - 80;
      }
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      estado = e::Esquivar3;
    }
  break;
  
  case e::Esquivar3:
    if(abs(ErrorDireccionActual) <= 10){
      if (esquivarDerecha) {
        direccionObjetivo = direccionObjetivo - 40;
      } else {
        direccionObjetivo = direccionObjetivo + 40;
      }
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      delay(10);
      setVelocidad(20);
      if ((medidaencoder - MarcaEncoderTramo) >= 1200){
        estado = e::Recto;
      } else {
        estado = e::Esquivar4;
      }
    }
  break;

  case e::Esquivar4:
    if(abs(ErrorDireccionActual) <= 15){
      setVelocidad(0);
      delay(20);
      MarcaEncoder = medidaencoder;
      setVelocidad(-20);
      estado = e::Atras;
    }
  break;

 }
}
