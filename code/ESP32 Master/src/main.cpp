#include <Arduino.h>
#include <Wire.h>
#include <MPU9250.h>

float valor = 0;
float offset;
uint32_t Duracion_de_la_muestra = 0;

long solicitudEncoder();
byte medidaUltrasonidos[3];

void Calibrar(){ // función para calibrar ( revisar )
  mpu.verbose(true);  
  delay(1000);
  mpu.calibrateMag();
  mpu.calibrateAccelGyro();
  mpu.verbose(false);
  saveCalibration();
}

void setup() {
  Wire.begin();
  Serial.begin(115200);

  //Calibrar();

  if (!mpu.setup(0x68)) {  // change to your own address
    while (1) {
      Serial.println("MPU connection failed. Please check your connection with `connection_check` example.");
      delay(5000);
      }
    }

  loadCalibration();


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

}

void loop() {
  long data = medirEncoder();
  Serial.println(data);
  delay(100);
  
  static uint32_t prev_ms = millis();
    if (mpu.update()) {
        Duracion_de_la_muestra = millis() - prev_ms;
        prev_ms = millis();
        valor = valor + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
    }
} 

long medirEncoder() {
  Wire.beginTransmission(4);
  Wire.write(1);
  Wire.endTransmission();
  Wire.requestFrom(4,4);
  long medidaEncoder;
  medidaEncoder = Wire.read();
  medidaEncoder = medidaEncoder | Wire.read()<<8;
  medidaEncoder = medidaEncoder | Wire.read()<<16;
  medidaEncoder = medidaEncoder | Wire.read()<<24;
  return medidaEncoder;
}

void medirUltrasonidos(){
  Wire.beginTransmission(4);
  Wire.write(2);
  Wire.endTransmission();
  Wire.requestFrom(4,3);
  byte iteracion = 0;
  while (Wire.available()){
    medidaUltrasonidos[iteracion] = Wire.read();
    iteracion++;
  }
}

void setVelocidad(byte velocidad){
  Wire.beginTransmission(4);
  Wire.write(3);
  Wire.write(velocidad);
  Wire.endTransmission();
}

void setGiro(int angulo){
  Wire.beginTransmission(4);
  Wire.write(4);
  Wire.write(angulo);
  Wire.endTransmission();
}