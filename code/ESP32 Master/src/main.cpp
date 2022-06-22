#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>

float valorBrujula = 0;
float offset;
int vuelta = 1;
int giros = 0;
uint32_t Duracion_de_la_muestra = 0;
MPU9250 mpu;

int sentidoGiro = 1;

long solicitudEncoder();
byte medidasUltrasonidos[3];
int ultraDerecho = 2;
int ultraCentral = 0;
int ultraIzquierdo = 1;

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

  setEnable(1);
  setVelocidad(20);
  


}

int ErrorDireccionAnterior = -100;
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


 switch (estado)
 {
 case e::Inico:
  if(medidasUltrasonidos[ultraCentral] < 80){
    estado = e::DecidiendoGiro;
    setVelocidad(20);
  } 
  break;

 case e::Recto:
  /*if(giros>=12){
   estado = e::Parado;
  }else*/ //if(MarcaEncoder - medidaencoder > 0){ //10cm con 120 pasos de encoder
    if(medidasUltrasonidos[ultraCentral] < 80){
      estado = e::DecidiendoGiro;
    }
  //}
  break;

 case e::DecidiendoGiro:
  if(medidasUltrasonidos[ultraIzquierdo] > 70){
    sentidoGiro = 1;
    estado = e::Girando;
  }else if(medidasUltrasonidos[ultraDerecho] > 70){
    sentidoGiro = -1;
    estado = e::Girando;
  }/*else if (medidasUltrasonidos[ultraCentral] < 20){
    setVelocidad(0);
    estado = e::Atras;
  }*/
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
