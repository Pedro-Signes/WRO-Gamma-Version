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

float valorBrujula = 0;
float offset;
int vuelta = 1;
int giros = 0;
uint32_t Duracion_de_la_muestra = 0;
MPU9250 mpu;

int UltrasonidosPrevio1[3];
int UltrasonidosPrevio2[3];

bool sentidoGiro = 1;

long solicitudEncoder();
byte medidasUltrasonidos[3];
byte ultraDerecho = 2;
byte ultraCentral = 0;
byte ultraIzquierdo = 1;

long medidaencoder = 0;
long MarcaEncoder = 0;

enum e{
  Recto,
  Girando,
  Parado,
  DecidiendoGiro,
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
  Wire.write(posicionServo);
  Wire.endTransmission();
}

void setVelocidad(byte velocidad){
  Wire.beginTransmission(4);
  Wire.write(3);
  Wire.write(velocidad);
  Wire.endTransmission();
}

void medirUltrasonidos(){
  byte i1 = 0;
  while (i1 < 3)
  {
    UltrasonidosPrevio2[i1] = UltrasonidosPrevio1[i1];
    i1++;
  }

  byte i2 = 0;
  while (i2 < 3)
  {
    UltrasonidosPrevio1[i2] = medidasUltrasonidos[i2];
    i2++;
  }

  Wire.beginTransmission(4);
  Wire.write(2);
  Wire.endTransmission();
  Wire.requestFrom(4,3);
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

  pinMode(LED_BUILTIN,OUTPUT);
  Wire.begin();
  uint32_t freq = 400000;
  Wire1.begin(15,4,freq);
  Serial.begin(115200);
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
      Serial.println("MPU connection failed. Please check your connection with `connection_check` example.");
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
  Serial.println("Todo funcionando");

  delay(2000);

  setEnable(1);
  setVelocidad(20);
  


}

int ErrorDireccionAnterior = 0;
int ErrorDireccionActual = 0;
int direccionObjetivo = 0; 

bool GiroRealizado = true;


void loop() {
  
  static uint32_t prev_ms = millis();
  if (mpu.update()) {
      Duracion_de_la_muestra = millis() - prev_ms;
      prev_ms = millis();
      valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
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


  static uint32_t prev_ms4 = millis();
  if (millis()> prev_ms4) {
    Udp.beginPacket(CONSOLE_IP, CONSOLE_PORT);
  // Just test touch pin - Touch0 is T0 which is on GPIO 4.
  Udp.printf(String(medidasUltrasonidos[ultraCentral]).c_str());
  Udp.printf(";");
  Udp.printf(String(medidasUltrasonidos[ultraDerecho]).c_str());
  Udp.printf(";");
  Udp.printf(String(medidasUltrasonidos[ultraIzquierdo]).c_str());
  Udp.printf(";");
  Udp.printf(String(medidaencoder - MarcaEncoder).c_str());
  Udp.printf(";");
  Udp.printf(String(estado).c_str());
  Udp.printf(";");
  Udp.printf(String(90*vuelta).c_str());
  Udp.printf(";");
  Udp.printf(String(valorBrujula).c_str());
  Udp.printf(";");
  Udp.printf(String(medidaencoder).c_str());
  Udp.endPacket();
  prev_ms4 = millis() + 20;
  }

 switch (estado)
 {
 case e::Inico:
  if(medidasUltrasonidos[ultraCentral] < 90){
    estado = e::DecidiendoGiro;
    setVelocidad(20);
  } 
  break;

 case e::Recto:
  /*if(giros>=12){
   estado = e::Parado;
  }else*/
    //if (abs(UltrasonidosPrevio1[ultraCentral] - medidasUltrasonidos[ultraCentral]) <= 10)
    //{
    if((medidaencoder - MarcaEncoder) > 900){ //10cm con 120 pasos de encoder
      if(medidasUltrasonidos[ultraCentral] < 90){
        estado = e::DecidiendoGiro;
      }
    //}
  }
    
  break;

 case e::DecidiendoGiro:

  /*bool valido = true;
  byte i = 1;
  while (i<3){
  if (abs(UltrasonidosPrevio1[i] - medidasUltrasonidos[i]) >= 10)
  {
    valido = false;
  }
  }*/
  if (true){ //if (valido){
  if(medidasUltrasonidos[ultraIzquierdo] > 70){
    sentidoGiro = 1;
    estado = e::Girando;
  }else if(medidasUltrasonidos[ultraDerecho] > 70){
    sentidoGiro = -1;
    estado = e::Girando;
  }/*else if (medidasUltrasonidos[ultraCentral] < 20){
    setVelocidad(0);
    estado = e::Atras;
  }*/}
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
    estado = e::Recto;
  }

  break;

 case e::Parado:
  if(true){
    setVelocidad(0);
  }
  break;

 case e::Atras:
  setVelocidad(-10);
  if(medidasUltrasonidos[ultraCentral] > 40){
   setVelocidad(0);
   if(medidasUltrasonidos[ultraIzquierdo] > 70){
    sentidoGiro = 1;
    setVelocidad(20);
    estado = e::Girando;
   }else if(medidasUltrasonidos[ultraDerecho] > 70){
    sentidoGiro = -1;
    setVelocidad(20);
    estado = e::Girando;
   }
  }
  break;
}

 



  /*if(true){
    if( > 2000)
    if(medidasUltrasonidos[0] < 75){
      if(medidasUltrasonidos[0] < 75){
        if(GiroRealizado){
          direccionObjetivo = 90*vuelta;
          vuelta++;
          ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
          GiroRealizado = false;
          giros++;
        }
      }
      /*if(medidasUltrasonidos[1] > 75){
        if(GiroRealizado){
          direccionObjetivo = 90*vuelta;
          vuelta++;
          ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
          GiroRealizado = false;
          giros++;
        }
      }*/
      /*}else if(medidasUltrasonidos[2] > 75){
        if(medidasUltrasonidos[0] < 90){
        if(GiroRealizado){
        direccionObjetivo = -90*vuelta; 
        vuelta++;
        ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
        GiroRealizado = false;
        giros++;
    }
  }*/

}
