#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>

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
  return -1*error;
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

void EnviarTelemetria()
{
  Serial.print(estado);
  Serial.print(",");
  Serial.print(medidasUltrasonidos[ultraFrontal]);
  Serial.print(",");
  Serial.print(medidasUltrasonidos[ultraTrasero]);
  Serial.print(",");
  Serial.print(medidasUltrasonidos[ultraDerecho]);
  Serial.print(",");
  Serial.print(medidasUltrasonidos[ultraIzquierdo]);
  Serial.print(",");
  Serial.print(MarcaEncoder);
  Serial.print(",");
  Serial.print(medidaencoder);
  Serial.print(",");
  Serial.print(medidaencoder - MarcaEncoder);
  Serial.print(",");
  Serial.print(direccionObjetivo);
  Serial.print(",");
  Serial.println(valorBrujula);
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

  pinMode(PIN_BOTON ,INPUT_PULLUP);
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

  while (digitalRead(PIN_BOTON)){
    medirUltrasonidos();
    EnviarTelemetria();
    delay(100);
  };

  setEnable(1);

  delay(1000);

}

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
      EnviarTelemetria();
  }



  static uint32_t prev_ms6;

 switch (estado)
 {
 case e::Inico:
  setVelocidad(20);
  if(medidasUltrasonidos[ultraFrontal] < 100){
    estado = e::DecidiendoGiroPrimero;
  }
  break;

 case e::RectoRapido:
  if(giros ==12){
   estado = e::Final;
  }else{
    setVelocidad(20);
    if((medidaencoder - MarcaEncoder) > 500){ //10cm con 120 pasos de encoder
      estado = e::RectoLento;
  }}
    
  break;

 case e::RectoLento:
  setVelocidad(20);
  if(medidasUltrasonidos[ultraFrontal] <= 100){
        estado = e::DecidiendoGiro;
      }
  break;

 case e::DecidiendoGiroPrimero:
  setVelocidad(20);
  
  if(medidasUltrasonidos[ultraIzquierdo] > 100){
    sentidoGiro = 1;
    Frenar(30);
    estado = e::Girando;
  }else if(medidasUltrasonidos[ultraDerecho] > 100){
    sentidoGiro = -1;
    Frenar(30);
    estado = e::Girando;
  }else Frenar(15);
  break;


 case e::DecidiendoGiro:
  if(medidasUltrasonidos[ultraIzquierdo] >= 120){
    estado = e::Girando;
  }else if(medidasUltrasonidos[ultraDerecho] >= 120){
    estado = e::Girando;
  } else {
  setVelocidad(20);
  if (medidasUltrasonidos[ultraFrontal] <= 40){
    setVelocidad(0);
    if (PrimeraParada){
      prev_ms5 = millis() + 250;
      PrimeraParada = false;
    }
    if (millis()> prev_ms5) {
      PrimeraParada = true;
      MarcaEncoder = medidaencoder;
      setVelocidad(-20);
      estado = e::Atras;}
  }
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
  if(abs(ErrorDireccionActual) < 15){
    GiroRealizado = true;
    MarcaEncoder = medirEncoder();
    estado = e::RectoRapido;
  }

  break;

 case e::Final:
  if((medidaencoder - MarcaEncoder) > 450){
    setVelocidad(0);
    setEnable(0);
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
