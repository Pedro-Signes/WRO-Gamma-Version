#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <Pixy2.h>

#define CONSOLE_IP "192.168.1.2"
#define CONSOLE_PORT 4210
const char* ssid = "ESP32";
const char* password = "12345678";
WiFiUDP Udp;
IPAddress local_ip(192, 168, 1, 1);
IPAddress gateway(192, 168, 1, 1);
IPAddress subnet(255, 255, 255, 0);
WebServer server(80);

#define tamanoMinimodeEsquive 55
#define GreenSignature 1
#define RedSignature 2

#define PIN_BOTON 13

float valorBrujula = 0;
float offset;
int vuelta = 1;
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

long solicitudEncoder();
byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraIzquierdo = 1;
byte ultraDerecho = 2;
byte ultraTrasero = 3;

long medidaencoder = 0;
long MarcaEncoder = 0;

bool forward = true;

enum e{
  Inicio,
  Recto,
  DecidiendoBloque,
  EsquivarDerecha1,
  EsquivarDerecha2,
  EsquivarDerecha3,
  EsquivarIzquierda1,
  EsquivarIzquierda2,
  EsquivarIzquierda3,
  DecidiendoGiro,
  ManiobraDerecha1,
  ManiobraDerecha2,
  ManiobraDerecha3,
  ManiobraDerecha4,
  ManiobraIzquierda1,
  ManiobraIzquierda2,
  ManiobraIzquierda3,
  ManiobraIzquierda4,
  ParadaNoSeQueMasHacer,
  Atras,
  Final
};

int estado = e::Inicio;


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
  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_ip, gateway, subnet);
  server.begin();
  pixy.init();

  Serial.begin(115200);

  pinMode(PIN_BOTON ,INPUT_PULLUP);

  pinMode(LED_BUILTIN,OUTPUT);
  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  delay(100);
  estado = e::Inicio;
  
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
  pixy.changeProg("line");
  digitalWrite(LED_BUILTIN,HIGH);

  

  

  while (digitalRead(PIN_BOTON));
  setEnable(1);
  delay(1000);


  setVelocidad(13);
  delay(500);
}


void enviarMensaje(int numero){
  Udp.beginPacket(CONSOLE_IP, CONSOLE_PORT);
  // Just test touch pin - Touch0 is T0 which is on GPIO 4.
  Udp.printf(String(numero).c_str());
  Udp.endPacket();
}



void EnviarTelemetria(){
  static uint32_t prev_ms4 = millis();
  if (millis()> prev_ms4) {
    Udp.beginPacket(CONSOLE_IP, CONSOLE_PORT);
    // Just test touch pin - Touch0 is T0 which is on GPIO 4.
    Udp.printf(String(medidasUltrasonidos[ultraFrontal]).c_str());
    Udp.printf(";");
    Udp.printf(String(medidasUltrasonidos[ultraDerecho]).c_str());
    Udp.printf(";");
    Udp.printf(String(medidasUltrasonidos[ultraIzquierdo]).c_str());
    Udp.printf(";");
    Udp.printf(String(medidasUltrasonidos[ultraTrasero]).c_str());
    Udp.printf(";");
    Udp.printf(String(estado).c_str());
    Udp.printf(";");
    Udp.printf(String(medidaencoder).c_str());
    Udp.printf(";");
    Udp.printf(String(medidaencoder - MarcaEncoder).c_str());
    Udp.printf(";");
    Udp.printf(String(90*vuelta).c_str());
    Udp.printf(";");
    Udp.printf(String(valorBrujula).c_str());
    Udp.printf(";");
    Udp.printf(String(ErrorDireccionAnterior).c_str());
    Udp.printf(";");
    Udp.printf(String(ErrorDireccionActual).c_str());
    Udp.printf(";");
    Udp.printf(String(giros).c_str());
    Udp.printf(";");
    Udp.printf(String(sentidoGiro).c_str());
    Udp.printf(";");
    Udp.printf(String(LecturaGiro).c_str());
    Udp.printf(";");
    Udp.printf(String(pixy.ccc.numBlocks).c_str());
    Udp.printf(";");
    Udp.printf(String(pixy.ccc.blocks[0].m_signature).c_str());
    Udp.printf(";");
    Udp.printf(String(pixy.line.numVectors).c_str());
    Udp.endPacket();
    prev_ms4 = millis() + 10;
  }
 }

void loop() {
  static uint32_t prev_ms = millis();
  if (mpu.update()) {
      Duracion_de_la_muestra = millis() - prev_ms;
      prev_ms = millis();
      valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
      ErrorDireccionActual = constrain(ErrorDireccion(valorBrujula,direccionObjetivo),-127,127);
      EnviarTelemetria();
      if(ErrorDireccionAnterior != ErrorDireccionActual){
        if (AutoGiro){
          if (forward){
            setGiro(ErrorDireccionActual);
          }else setGiro(-ErrorDireccionActual);
        }
        ErrorDireccionAnterior = ErrorDireccionActual;
      }
  }
    
  static uint32_t prev_ms2 = millis();
  if (millis()> prev_ms2) {
    prev_ms2 = millis() + 20;
    medirUltrasonidos();
    pixy.ccc.getBlocks();
  }

  static uint32_t prev_ms3 = millis();
  if (millis()> prev_ms3) {
      prev_ms3 = millis() + 30;
      medidaencoder = medirEncoder();
  }



  static uint32_t prev_ms6;
  int mayor = -1;
  int tamano = 0;
  
 switch (estado)
 {
 case e::Inicio:
  
  if (medidaencoder >190){
    setVelocidad(0);
    estado = e::DecidiendoGiro;
  }
  
  break;

  case e::Recto:

  if(pixy.ccc.numBlocks){
    for (int i=0; i < pixy.ccc.numBlocks; i++){
      if(pixy.ccc.blocks[i].m_height > tamano){
        mayor = i;
        tamano = pixy.ccc.blocks[i].m_height;
      }
    }
  }
  if (tamano > tamanoMinimodeEsquive){
    if(pixy.ccc.blocks[mayor].m_signature == GreenSignature) //Bloque de esquivar izquierda
    {
      setVelocidad(0);
      delay(50);
      direccionObjetivo = direccionObjetivo - 40;
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      setVelocidad(-15);
      MarcaEncoder=medidaencoder;
      estado = e::EsquivarIzquierda1;
    }
    else if (pixy.ccc.blocks[mayor].m_signature == RedSignature) //Bloque de esquivar derecha
    {
      setVelocidad(0);
      delay(50);
      direccionObjetivo = direccionObjetivo + 40;
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      setVelocidad(-15);
      MarcaEncoder=medidaencoder;
      estado = e::EsquivarDerecha1;
    }

  }
  if(medidasUltrasonidos[ultraFrontal] <= 30){
    estado = e::DecidiendoGiro;
  }
  if(medidasUltrasonidos[ultraFrontal] <= 10){
    estado = e::ParadaNoSeQueMasHacer;
  }
  
  break;

 case e::DecidiendoGiro:
  if (LecturaGiro){
    pixy.line.getMainFeatures(LINE_VECTOR);
    enviarMensaje(8888);
    enviarMensaje(pixy.line.numVectors);
    if (pixy.line.numVectors){
      enviarMensaje(9999);
      int x0 = pixy.line.vectors[0].m_x0;
      int y0 = pixy.line.vectors[0].m_y0;
      int x1 = pixy.line.vectors[0].m_x1;
      int y1 = pixy.line.vectors[0].m_y1;
      float m = (y1 - y0);
      if (m < 0){
        sentidoGiro = true;
        enviarMensaje(1);
      }else{
        sentidoGiro = false;
        enviarMensaje(-1);
      }
      LecturaGiro = false;
      MarcaEncoder = medidaencoder;
      if(pixy.changeProg("color") == 0){
        enviarMensaje(2222);
      }else{
        enviarMensaje(3333);
     }
      setVelocidad(-15);
      estado = e::Atras;
    }
  }else {
    if (sentidoGiro){
      setVelocidad(0);
      delay(20);
      estado = e::ManiobraDerecha1;
    } else {
      setVelocidad(0);
      delay(20);
      estado = e::ManiobraIzquierda1;
    }
  }
  delay(100);
  break;

  case e::Atras:
    if ((MarcaEncoder - medidaencoder) >= 190){
      setVelocidad(0);
      delay(20);
      setVelocidad(17);
      estado = e::Recto;
    }
  break;

 case e::Final:
  if((medidaencoder - MarcaEncoder) > 500){
    setVelocidad(0);
  }
  break;

 case e::ParadaNoSeQueMasHacer:
  setVelocidad(0);
  estado = e::DecidiendoGiro;
  break;

 case e::EsquivarDerecha1:
  if ((MarcaEncoder - medidaencoder) >= 50 ){
    direccionObjetivo = direccionObjetivo - 80;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    setGiro(ErrorDireccionActual);
    setVelocidad(0);
    delay(20);
    setVelocidad(13);
    estado = e::EsquivarDerecha2;
  }
  break;

 case e::EsquivarDerecha2:
   
  if(abs(ErrorDireccionActual) <= 5){
    direccionObjetivo = direccionObjetivo + 80;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    setGiro(ErrorDireccionActual);
    estado = e::EsquivarDerecha3;
  }
  break;
  
  case e::EsquivarDerecha3:
   if(abs(ErrorDireccionActual) <= 5){
    direccionObjetivo = direccionObjetivo -40;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    setGiro(ErrorDireccionActual);
    setVelocidad(13);
    estado = e::Recto;
   }

  break;

  case e::EsquivarIzquierda1:
    
    if ((MarcaEncoder - medidaencoder) >= 20 ){
    direccionObjetivo = direccionObjetivo + 80;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    setGiro(ErrorDireccionActual);
    setVelocidad(0);
    delay(20);
    setVelocidad(13);

    estado = e::EsquivarIzquierda2;
  }

  break;

  case e::EsquivarIzquierda2:
   if(abs(ErrorDireccionActual) <= 5){
    direccionObjetivo = direccionObjetivo - 80;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    setGiro(ErrorDireccionActual);
    estado = e::EsquivarIzquierda3;
  }

  break;

  case e::EsquivarIzquierda3:
   if(abs(ErrorDireccionActual) <= 5){
    direccionObjetivo = direccionObjetivo + 40;
    ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
    setGiro(ErrorDireccionActual);
    setVelocidad(13);
    estado = e::Recto;
   }
  break;

  case e::ManiobraDerecha1:
    AutoGiro = false;
    setGiro(23);
    MarcaEncoder = medidaencoder;
    setVelocidad(-15);
    estado = e::ManiobraDerecha2;

  break;

  case e::ManiobraDerecha2:
    if((medidaencoder - MarcaEncoder)<-325){
      setVelocidad(0);
      direccionObjetivo = direccionObjetivo - 90;
      AutoGiro = true;
      setVelocidad(20);
      estado = e::ManiobraDerecha3;
    }  
  break;

  case e::ManiobraDerecha3:
    if((abs(ErrorDireccionActual) <= 20) || (medidasUltrasonidos[ultraFrontal] <= 15)){
      setVelocidad(0);
      AutoGiro = false;
      MarcaEncoder = medidaencoder;
      setGiro(+5);
      setVelocidad(-15);
      estado = e::ManiobraDerecha4;
    }
  break;

  case e::ManiobraDerecha4:
    if(medidasUltrasonidos[ultraTrasero] <= 15){
      setVelocidad(0);
      AutoGiro = true;
      setVelocidad(20);
      giros ++;
      estado = e::Recto;
    }
  break;
  
    
  case e::ManiobraIzquierda1:
    AutoGiro = false;
    setGiro(-23);
    MarcaEncoder = medidaencoder;
    setVelocidad(-15);
    estado = e::ManiobraIzquierda2;

  break;

  case e::ManiobraIzquierda2:
    if((medidaencoder - MarcaEncoder)<-325){
      setVelocidad(0);
      direccionObjetivo = direccionObjetivo + 90;
      AutoGiro = true;
      setVelocidad(20);
      estado = e::ManiobraIzquierda3;
    }  
  break;

  case e::ManiobraIzquierda3:
    if((abs(ErrorDireccionActual) <= 20) || (medidasUltrasonidos[ultraFrontal] <= 15)){
      setVelocidad(0);
      AutoGiro = false;
      MarcaEncoder = medidaencoder;
      setGiro(-5);
      setVelocidad(-15);
      estado = e::ManiobraIzquierda4;
    }
  break;

  case e::ManiobraIzquierda4:
    if(medidasUltrasonidos[ultraTrasero] <= 15){
      setVelocidad(0);
      AutoGiro = true;
      setVelocidad(20);
      giros ++;
      estado = e::Recto;
    }
  break;

 }


}
