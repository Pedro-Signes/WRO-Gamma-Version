#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>

#define CONSOLE_IP "192.168.1.2"
#define CONSOLE_PORT 4210
const char* ssid = "ESP32";
const char* password = "12345678";
WiFiUDP Udp;
IPAddress local_ip(192, 168, 1, 1);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0);
WebServer server(80);

#define PIN_BOTON 13

float valorBrujula = 0;
float offset;
int vuelta = 1;
int giros = 0;
int sentidoGiro = 0;

int ErrorDireccionAnterior = 0;
int ErrorDireccionActual = 0;
int direccionObjetivo = 0; 

bool GiroRealizado = true;
bool PrimeraParada = true;
bool SegundaParada = true;

uint32_t Duracion_de_la_muestra = 0;
MPU9250 mpu;

long solicitudEncoder();
byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraIzquierdo = 1;
byte ultraDerecho = 2;
byte ultraTrasero = 3;

long medidaencoder = 0;
long MarcaEncoder = 0;


enum e{
  RectoRapido,
  RectoLento,
  Girando,
  Final,
  DecidiendoGiro,
  DecidiendoGiroPrimero,
  Inico,
  Atras
};

int estado = e::Inico;


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
  }else{
    Wire.write(velocidad);
    Wire.write(2);
  }
  Wire.endTransmission();
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

uint32_t prev_ms5;
void Frenar(byte distancia){
  if (medidasUltrasonidos[ultraFrontal] <= distancia){
    setVelocidad(0);
    if (PrimeraParada){
      prev_ms5 = millis() + 400;
      PrimeraParada = false;
    }
    if (millis()> prev_ms5) {
      PrimeraParada = true;
      estado = e::Atras;
  }
  }
}

void setup() {

  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_ip, gateway, subnet);
  server.begin();

  pinMode(PIN_BOTON ,INPUT_PULLUP);
  pinMode(LED_BUILTIN,OUTPUT);

  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);
  setEnable(1);
  estado = e::Inico;
  
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

  digitalWrite(LED_BUILTIN, HIGH);

  while (digitalRead(PIN_BOTON));

  setEnable(1);

  delay(1000);

}

/*
void enviarMensaje(int numero){
  Udp.beginPacket(CONSOLE_IP, CONSOLE_PORT);
  // Just test touch pin - Touch0 is T0 which is on GPIO 4.
  Udp.printf(String(numero).c_str());
  Udp.endPacket();
}*/


void loop() {
  
  static uint32_t prev_ms = millis();
  if (mpu.update()) {
      Duracion_de_la_muestra = millis() - prev_ms;
      prev_ms = millis();
      valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
      ErrorDireccionActual = constrain(ErrorDireccion(valorBrujula,direccionObjetivo),-127,127);
      if(ErrorDireccionAnterior != ErrorDireccionActual){
        setGiro(ErrorDireccionActual);
        ErrorDireccionAnterior = ErrorDireccionActual;
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



  static uint32_t prev_ms6;

 switch (estado)
 {
 case e::Inico:
  setVelocidad(25);
  if(medidasUltrasonidos[ultraFrontal] < 90){
    estado = e::DecidiendoGiroPrimero;
  }
  break;

 case e::RectoRapido:
  if(giros ==12){
   estado = e::Final;
  }else{
    setVelocidad(40);
    if((medidaencoder - MarcaEncoder) > 450){ //10cm con 120 pasos de encoder
      estado = e::RectoLento;
  }}
    
  break;

 case e::RectoLento:
  setVelocidad(25);
  if(medidasUltrasonidos[ultraFrontal] < 90){
        estado = e::DecidiendoGiro;
      }
  break;

 case e::DecidiendoGiroPrimero:
  setVelocidad(13);
  
  if(medidasUltrasonidos[ultraIzquierdo] > 90){
    sentidoGiro = 1;
    Frenar(30);
    estado = e::Girando;
  }else if(medidasUltrasonidos[ultraDerecho] > 90){
    sentidoGiro = -1;
    Frenar(30);
    estado = e::Girando;
  }else Frenar(15);
  break;


 case e::DecidiendoGiro:
  setVelocidad(15);
  if (medidasUltrasonidos[ultraFrontal] <= 45){
    setVelocidad(0);
    if (PrimeraParada){
      prev_ms5 = millis() + 250;
      PrimeraParada = false;
    }
    if (millis()> prev_ms5) {
      PrimeraParada = true;
      MarcaEncoder = medidaencoder;
      setVelocidad(-20);
      estado = e::Atras;
  }
  }
  else if(medidasUltrasonidos[ultraIzquierdo] > 90){
    estado = e::Girando;
  }else if(medidasUltrasonidos[ultraDerecho] > 90){
    estado = e::Girando;
  }
  break;

 case e::Girando:
  if(GiroRealizado){
    direccionObjetivo = sentidoGiro*90*vuelta;
    vuelta++;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    GiroRealizado = false;
    giros++;
  }
  if(abs(ErrorDireccionActual) < 10){
    GiroRealizado = true;
    MarcaEncoder = medirEncoder();
    estado = e::RectoRapido;
  }

  break;

 case e::Final:
  if((medidaencoder - MarcaEncoder) > 500){
    setVelocidad(0);
  }
  break;


 case e::Atras:
  if((MarcaEncoder - medidaencoder) >= 190){
   setVelocidad(0);
   MarcaEncoder=medidaencoder + 1000;
   if (SegundaParada){
    prev_ms6 = millis() + 250;
    SegundaParada = false;
   }
   if (millis()> prev_ms6) {
    SegundaParada = true;
    if (sentidoGiro==0){
      estado= e::DecidiendoGiro;
    }else{
      setVelocidad(20);
      estado = e::Girando;
    }
   }
  }
  break;
}

}
