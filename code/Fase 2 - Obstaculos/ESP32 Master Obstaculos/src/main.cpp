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

bool esquivarDerecha = false;

long solicitudEncoder();
byte medidasUltrasonidos[4];
byte ultraFrontal = 0;
byte ultraIzquierdo = 1;
byte ultraDerecho = 2;
byte ultraTrasero = 3;

long medidaencoder = 0;
long MarcaEncoder = 0;
long MarcaEncoderTramo = -2000;

bool forward = true;

bool PasadoDerecha = false;

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
  Posicionamiento1,
  Posicionamiento2,
  Posicionamiento3,
  Posicionamiento4,
  ComprobacionPosicion,
  Centrar1,
  Centrar2,
  Centrar3,
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
  Serial.print(MarcaEncoderTramo);
  Serial.print(",");
  Serial.println(valorBrujula);
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

bool ComprobarPoscicion() {
  if (sentidoGiro) {
    if (medidasUltrasonidos[ultraIzquierdo] <= 36) {
      PasadoDerecha = false;
      return 1;
    } else if (medidasUltrasonidos[ultraIzquierdo] >= 58) {
      PasadoDerecha = true;
      return 1;
    } else {
      return 0;
    }
  }
  else {
    if (medidasUltrasonidos[ultraDerecho] <= 36){
      PasadoDerecha = true;
      return 1;
    } else if (medidasUltrasonidos[ultraDerecho] >= 58){
      PasadoDerecha = false;
      return 1;
    } else {
      return 0;
    }
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
  estado = e::Inicio;
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


  setVelocidad(13);
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
          }else setGiro(-ErrorDireccionActual);
        }
        ErrorDireccionAnterior = ErrorDireccionActual;
        EnviarTelemetria();
      }
  }
    
  static uint32_t prev_ms2 = millis();
  if (millis()> prev_ms2) {
    prev_ms2 = millis() + 20;
    medirUltrasonidos();
    if (!LecturaGiro) {
      pixy.ccc.getBlocks();
      }
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
    if (medidaencoder > 400){
      setVelocidad(0);
      estado = e::DecidiendoGiro;
    }
  break;

  case e::Recto:
    if ((giros == 12) && ((medidaencoder - MarcaEncoderTramo) >= 1100)) {
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
        direccionObjetivo = direccionObjetivo - 40;
      } else if(pixy.ccc.blocks[mayor].m_signature == GreenSignature){
        esquivarDerecha = false;
        direccionObjetivo = direccionObjetivo + 40;
      }
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      setVelocidad(-15);
      MarcaEncoder = medidaencoder;
      estado = e::Esquivar1;
    }
    if((medidasUltrasonidos[ultraFrontal] <= 30) && ((medidaencoder - MarcaEncoderTramo) >= 1300)){
      estado = e::DecidiendoGiro;
    }
    else if(medidasUltrasonidos[ultraFrontal] <= 15){
      setVelocidad(0);
      MarcaEncoder = medidaencoder;
      setVelocidad(-15);
      estado = e::Atras;
    }
  break;

  case e::DecidiendoGiro:
    if (LecturaGiro){
      pixy.line.getMainFeatures(LINE_VECTOR);
      delay(100);
      enviarMensaje(8888);

      enviarMensaje(pixy.line.numVectors);
      
      if (pixy.line.numVectors){
        enviarMensaje(9999);
        float x0 = pixy.line.vectors[0].m_x0;
        float y0 = pixy.line.vectors[0].m_y0;
        float x1 = pixy.line.vectors[0].m_x1;
        float y1 = pixy.line.vectors[0].m_y1;
        float m = (y1 - y0)*(x1 - x0);
        if (m < 0){
          sentidoGiro = false;
          enviarMensaje("Izquierda");
          LecturaGiro = false;
          MarcaEncoder = medidaencoder;
          setVelocidad(-15);
          estado = e::Atras;
        }else if(m > 0){
          sentidoGiro = true;
          enviarMensaje("Derecha");
          LecturaGiro = false;
          MarcaEncoder = medidaencoder;
          setVelocidad(-15);
          estado = e::Atras;
        }
        else{
          enviarMensaje("No detecta linea");
        }
        Serial.println(m);
      }
    }else {
        setVelocidad(0);
        delay(20);
        estado = e::Maniobra1;
    }
    delay(1000);
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
    setVelocidad(0);
    setEnable(0);
  break;

  case e::ParadaNoSeQueMasHacer:
    setVelocidad(0);
    estado = e::DecidiendoGiro;
  break;

  case e::Esquivar1:
    if ((MarcaEncoder - medidaencoder) >= 50 ){
      if (esquivarDerecha) {
        direccionObjetivo = direccionObjetivo - 0;
      } else {
        direccionObjetivo = direccionObjetivo + 0;
      }
      ErrorDireccionActual = ErrorDireccion(valorBrujula,direccionObjetivo);
      setGiro(ErrorDireccionActual);
      setVelocidad(0);
      delay(20);
      setVelocidad(13);
      estado = e::Esquivar2;
    }
  break;

  case e::Esquivar2:
    if(abs(ErrorDireccionActual) <= 5){
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
      setVelocidad(13);
      if ((medidaencoder - MarcaEncoderTramo) >= 1200){
        estado = e::Recto;
      } else {
      estado = e::Esquivar4;
      }
    }
  break;

  case e::Esquivar4:
    if(abs(ErrorDireccionActual) <= 10){
      setVelocidad(0);
      delay(10);
      MarcaEncoder = medidaencoder;
      setVelocidad(-13);
      estado = e::Atras;
    }
  break;



  case e::Maniobra1:
    AutoGiro = false;
    if (sentidoGiro) {
      direccionObjetivo = direccionObjetivo - 90;
      setGiro(30);
    } else {
      direccionObjetivo = direccionObjetivo + 90;
      setGiro(-30);
    }
    MarcaEncoder = medidaencoder;
    setVelocidad(-20);
    estado = e::Maniobra2;
  break;

  case e::Maniobra2:
    if((medidaencoder - MarcaEncoder)<-100){
      setVelocidad(0);
      estado = e::Posicionamiento1;
    }  
  break;


  case e::Posicionamiento1:
    if (sentidoGiro) {
    setGiro(-20);
    } else {
    setGiro(20);
    }
    MarcaEncoder = medidaencoder;
    delay(10);
    setVelocidad(20);
    estado = e::Posicionamiento2;
  break;
 

  case e::Posicionamiento2:
    if ((medidaencoder - MarcaEncoder) > 45){
    delay(10);
    setVelocidad(0);
    if (sentidoGiro) {
      setGiro(20);
    } else {
      setGiro(-20);
    }
    MarcaEncoder = medidaencoder;
    delay(20);
    setVelocidad(-20);
    estado = Posicionamiento3;
    }
  break;
 
  case e::Posicionamiento3:
    if((medidaencoder - MarcaEncoder)< -45){
      delay(10);
      setVelocidad(0);
      if (abs(ErrorDireccionActual) <= 15){
        AutoGiro = true;
        giros++;
        delay(20);
        setVelocidad(-15);
        estado = e::Posicionamiento4;
      }else {
        estado = e::Posicionamiento1;
      }
    }
  break;
  
  case e::Posicionamiento4:
    if (medidasUltrasonidos[ultraTrasero] <= 15) {
      setVelocidad(0);
      delay(50);
      MarcaEncoderTramo = medidaencoder;
      setVelocidad(17);
      estado = e::ComprobacionPosicion;
    }
  break;

  case e::ComprobacionPosicion:
    setVelocidad(0);
    if (ComprobarPoscicion()){
      if(PasadoDerecha){
        direccionObjetivo = direccionObjetivo + 23;
      }
      else{
        direccionObjetivo = direccionObjetivo- 23;
      }
      setVelocidad(10);
      estado = e::Centrar1;
    }
    else{
      setVelocidad(17);
      AutoGiro = true;
      estado = e::Recto;
    }
  break;
  
  case e::Centrar1:
  if(abs(ErrorDireccionActual) <= 10){
    if(PasadoDerecha){
      direccionObjetivo = direccionObjetivo - 23;
    } else {
      direccionObjetivo = direccionObjetivo + 23;
    }
    setVelocidad(10);
  }
  break;

  case e:: Centrar2:
  if(abs(ErrorDireccionActual) <= 10){
    setVelocidad(0);
    delay(20);
    setVelocidad(-13);
    estado = e::Centrar3;
  }
  break;

  case e::Centrar3:
    if (medidasUltrasonidos[ultraTrasero] <= 15){
      estado = e::ComprobacionPosicion;
    }
  break;
 }  

}