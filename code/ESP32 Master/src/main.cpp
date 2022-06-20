#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>

float valorBrujula = 0;
float offset;
uint32_t Duracion_de_la_muestra = 0;
MPU9250 mpu;

long solicitudEncoder();
byte medidasUltrasonidos[3]; // el primero es el central, el segundo el izquierdo, y el ultimo es el derecho

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
  long medidaEncoder;
  byte iteracion = 0;
  while( iteracion < 4){
    medidaEncoder = medidaEncoder | Wire.read()<<(8*iteracion);
    iteracion++;
  }
  return medidaEncoder;
}

void setEnable(int motrorEnable){
  Wire.beginTransmission(4);
  Wire.write(5);
  Wire.write(motrorEnable);
  Wire.endTransmission();
}

void setGiro(int angulo){
  Wire.beginTransmission(4);
  Wire.write(4);
  Wire.write(angulo);
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

  setVelocidad(20);


}

void loop() {
  
  static uint32_t prev_ms = millis();
  if (mpu.update()) {
      Duracion_de_la_muestra = millis() - prev_ms;
      prev_ms = millis();
      valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
  }
    
  static uint32_t prev_ms2 = millis();
  if (millis()> prev_ms2) {
      prev_ms2 = millis() + 20;
      medirUltrasonidos();
  }

  if(medidasUltrasonidos[1] > 100){
    setVelocidad(0);
  }

  
}
