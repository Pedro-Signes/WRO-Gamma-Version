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
  medidaEncoder = Wire.read();
  medidaEncoder = medidaEncoder | Wire.read()<<8;
  medidaEncoder = medidaEncoder | Wire.read()<<16;
  medidaEncoder = medidaEncoder | Wire.read()<<24;
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
  Serial.begin(115200);

  //Calibrar();

  for(int i = 0; i<20 ; i++){
    digitalWrite(LED_BUILTIN,!digitalRead(LED_BUILTIN));
    delay(100);
  }

  while(!mpu.setup(0x68)) {  // change to your own address
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

  setEnable(1);

  while(true){

    setVelocidad(30);
    delay(1000);
    setVelocidad(0);
    delay(1000);



  }


}

void loop() {
  long data = medirEncoder();
  Serial.println(data);
  delay(100);
  
  static uint32_t prev_ms = millis();
    if (mpu.update()) {
        Duracion_de_la_muestra = millis() - prev_ms;
        prev_ms = millis();
        valorBrujula = valorBrujula + ((mpu.getGyroZ() - offset)*Duracion_de_la_muestra/1000);
    }

 /* if(medidasUltrasonidos[0,1,0] >= 255){
    setGiro(90);
  }else{
    medirUltrasonidos();
    delay(100);
  }*/

  
}
