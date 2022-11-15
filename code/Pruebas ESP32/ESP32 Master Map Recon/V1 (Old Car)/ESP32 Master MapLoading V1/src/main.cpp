#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <Pixy2.h>


#define tamanoMinimodeEsquive 55
#define GreenSignature 1
#define RedSignature 2

#define PIN_BOTON 13

#define TramosTotales 11 // VueltasTotales * 4 - 1

float valorBrujula = 0;
float offset;
int giros = 0;
bool sentidoGiro = true;
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

bool esquivarDerecha = false;

long solicitudEncoder();
byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraIzquierdo = 1;
byte ultraDerecho = 2;
byte ultraTrasero = 3;

/*
enum ultra{
  Frontal,
  Izquierdo,
  Derecho,
  Trasero
};*/

long medidaencoder = 0;
long MarcaEncoder = 0;
long MarcaUltimoEncoder = 0;

bool forward = true;

enum e{
  Precursor,
  Enlace1,
  Enlace2,
  Recto,
  Curva1,
  Curva2,
  Curva3,
  Giro,
  Final
};

// Block Saving
int Map[4][2][3] = {
  {{0,0,RedSignature},{0,0,RedSignature}}

};                        // [Tramo] -> 0,1,2,3 ;  [NumeroBloque] -> 0,1 ; [Info] -> 0(x) 1(y) 2(color)
byte BlockNumber[4] = {0,0,0,0};
long blockDistance = 0;
int tramo = -1;

// Map loading
byte Route[4];
bool tramoDerecha[4];     // Si hay que hacer el tramo por la derecha (true) o por la izquierda (false)

void routeDecision() {
  for (byte _tramo = 0; _tramo < 4; _tramo++){
    if (Map[_tramo][0][2] == RedSignature){                          // Si el bloque es rojo
      Route[_tramo] = e::Recto;
      tramoDerecha[_tramo] = true;
      if (Map[_tramo][1][2] = GreenSignature) {
        Route[_tramo] = e::Curva1;
      }
    } else if (Map[_tramo][0][2] == GreenSignature) {                        // Si el bloque es verde
      Route[_tramo] = e::Recto;
      tramoDerecha[_tramo] = false;
      if (Map[_tramo][1][2] = RedSignature) {
        Route[_tramo] = e::Curva1;
      }
    }
  }
}

int estado = e::Precursor;


/*void Calibrar(){ // función para calibrar ( revisar )
  mpu.verbose(true);  
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}*/



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

// Devuelve la posición donde hay que poner el servo
int ErrorDireccion(int bearing, int target){
  int error = bearing - target;
  if (error == 0) return 0;
  if (error > 180) error -= 360;
  if (error < -180) error += 360;
  return -2*error;
}


void setEnable(int motrorEnable){
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
    Wire.write(2);
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

void enviarMensaje(int numero){
 Serial.println(numero);
}
void enviarMensaje(String texto){
 Serial.println(texto);
}

void EnviarTelemetria()
{
  Serial.print(estado);
  Serial.print(",");
  Serial.print(medidasUltrasonidos[ultraFrontal]);
  Serial.print(",");
  Serial.print(medidasUltrasonidos[ultraTrasero]);
  Serial.print(",");
  Serial.print(MarcaEncoder);
  Serial.print(",");
  Serial.print(medidaencoder);
  Serial.print(",");
  Serial.print(medidaencoder - MarcaEncoder);
  Serial.print(",");
  Serial.println(valorBrujula);
  Serial.print(",");
  Serial.println(Route[0]);
  Serial.print(",");
  Serial.println(tramoDerecha[0]);
}

void medirUltrasonidos(){

  Wire.beginTransmission(4);
  Wire.write(2);
  Wire.endTransmission();
  Wire.requestFrom(4,4);
  byte iteracion = 0;
  while (Wire.available()){
    medidasUltrasonidos[iteracion] = Wire.read();
    iteracion++;
  }
}

void setup() {
  pixy.init();

  Serial.begin(115200);


  pinMode(PIN_BOTON ,INPUT_PULLUP);

  pinMode(LED_BUILTIN,OUTPUT);
  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);
  WiFi.disconnect(true);
  WiFi.mode(WIFI_OFF);
  //Calibrar();

  for(int i = 0; i<20 ; i++){
    digitalWrite(LED_BUILTIN,!digitalRead(LED_BUILTIN));
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

  medirUltrasonidos();
   
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

  for( int i = 0; i<4; i++){
    enviarMensaje(pixy.changeProg("line"));
  }

  digitalWrite(LED_BUILTIN,HIGH);
  
  while (digitalRead(PIN_BOTON));
  setEnable(1);
  delay(1000);


  setVelocidad(20);
  delay(500);
}


void loop() {
  static uint32_t prev_ms = millis();
  if (mpu.update()) {
      Duracion_de_la_muestra = millis() - prev_ms;
      prev_ms = millis();
      valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
      ErrorDireccionActual = constrain(ErrorDireccion(valorBrujula,direccionObjetivo),-127,127);
      if(ErrorDireccionAnterior != ErrorDireccionActual){
        if (AutoGiro){
          if (forward){
            setGiro(ErrorDireccionActual);
          } else setGiro(-ErrorDireccionActual);
        }
        ErrorDireccionAnterior = ErrorDireccionActual;
        EnviarTelemetria();
      }
  }
    
  static uint32_t prev_ms2 = millis();
  if (millis()> prev_ms2) {
    prev_ms2 = millis() + 20;
    medirUltrasonidos();
  }

  static uint32_t prev_ms3 = millis();
  if (millis()> prev_ms3) {
      prev_ms3 = millis() + 30;
      medidaencoder = medirEncoder();
  }
  
 switch (estado)
  {
  case e::Precursor:
    routeDecision();
    setVelocidad(20);
    estado = e::Enlace1;
  break;

  case e::Enlace1:
    if (tramoDerecha[tramo]) {
      direccionObjetivo = direccionObjetivo - 30;
    } else {
      direccionObjetivo = direccionObjetivo + 30;
    }
    MarcaEncoder = medidaencoder;
    setVelocidad(20);
    estado = e::Enlace2;
  break;

  case e::Enlace2:
    if (abs(ErrorDireccionActual) <= 10){ // if ((medidaencoder - MarcaEncoder) >= algo) {
      if (tramoDerecha[tramo]) {
        direccionObjetivo = direccionObjetivo + 30;
      } else {
        direccionObjetivo = direccionObjetivo - 30;
      }
      MarcaEncoder = medidaencoder;
      setVelocidad(0); // estado = Route[tramo % 4];
    }
  break;

  case e::Recto:
    setVelocidad(20);
    if (medidaencoder - MarcaEncoder >= 200){   // Revisar numero de encoders
      if (tramo == TramosTotales){
        estado = e::Final;
      } else if (medidaencoder - MarcaEncoder >= 300){  // Revisar numero de encoders
        MarcaEncoder = medidaencoder;
        estado = e::Giro;
      }
    }
  break;

  case e::Curva1:
    setVelocidad(20);
    if (medidaencoder - MarcaEncoder >= 200){ // Revisar numero de encoders
      if (tramo != TramosTotales){
        if (tramoDerecha[tramo]){
          direccionObjetivo = direccionObjetivo + 30;
        } else {
          direccionObjetivo = direccionObjetivo - 30;
        }
        estado = e::Curva2;
      } else {
        estado = e::Final;
      }
    }
  break;

  case e::Curva2:
    setVelocidad(20);
    if (abs(ErrorDireccionActual) <= 10){  // if ((medidaencoder - MarcaEncoder) >= algo) {
      if (tramoDerecha[tramo]){
        direccionObjetivo = direccionObjetivo - 30;
      } else {
        direccionObjetivo = direccionObjetivo + 30;
      }
      MarcaEncoder = medidaencoder;
      estado = e::Curva3;
    }
  break;

  case e::Curva3:
    setVelocidad(20);
    if ((medidaencoder - MarcaEncoder) >= 200){ // Revisar numero de encoders
      estado = e::Giro;
    }
  break;

  case e::Giro:

    MarcaEncoder = medidaencoder;
    estado = Route[tramo % 4];
  break;

  case e::Final:
    setVelocidad(0);
    setEnable(0);
  break;

  }
  
}