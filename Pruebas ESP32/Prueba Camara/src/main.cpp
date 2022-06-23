#include <Arduino.h>
#include <Pixy2.h>
#include <Wire.h>
#include <MPU9250.h>
#include <WebServer.h>
#include <WiFi.h>
#include <WiFiUdp.h>

Pixy2 pixy;

int Color1;
int PosicionX1;
int PosicionY1;
int Altura1;
int Anchura1;

int Color2;
int PosicionX2;
int PosicionY2;
int Altura2;
int Anchura2;

int AnchuraPrevia1;
int AnchuraPrevia2;

int ErrorDireccionAnterior = 0;
int ErrorDireccionActual = 0;
int direccionObjetivo = 0; 

float valorBrujula = 0;
float offset;
int vuelta = 1;
int giros = 0;
uint32_t Duracion_de_la_muestra = 0;
MPU9250 mpu;

int ErrorDireccion(int bearing, int target){
  int error = bearing - target;
  if (error == 0) return 0;
  if (error > 180) error -= 360;
  if (error < -180) error += 360;
  return -2*error;
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

void setup() {
  // put your setup code here, to run once:

  pixy.init();
  Serial.begin(115200);

}

void loop() {
  // put your main code here, to run repeatedly:

 // setGiro(0);

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

  pixy.ccc.getBlocks();

  Color1 = pixy.ccc.blocks[0].m_signature;
  PosicionX1 = pixy.ccc.blocks[0].m_x;
  PosicionY1 = pixy.ccc.blocks[0].m_y;
  Altura1 = pixy.ccc.blocks[0].m_height;
  Anchura1 = pixy.ccc.blocks[0].m_width;

  Color2 = pixy.ccc.blocks[1].m_signature;
  PosicionX2 = pixy.ccc.blocks[1].m_x;
  PosicionY2 = pixy.ccc.blocks[1].m_y;
  Altura2 = pixy.ccc.blocks[1].m_height;
  Anchura2 = pixy.ccc.blocks[1].m_width;

  static uint32_t prev_ms4 = millis();
  if (millis()> prev_ms4) 
  {
    if (AnchuraPrevia1 == Anchura1)
  {
    if (AnchuraPrevia1 == Anchura1)
    {
      Color1 = 0;
      PosicionX1 = 0;
      PosicionY1 = 0;
      Altura1 = 0;
      Anchura1 = 0;
    }
  }

  if (AnchuraPrevia2 == Anchura2)
  {
    if (AnchuraPrevia2 == Anchura2)
    {
      Color2 = 0;
      PosicionX2 = 0;
      PosicionY2 = 0;
      Altura2 = 0;
      Anchura2 = 0;
    }
  }
    prev_ms4 = millis() + 150;
  }

  static uint32_t prev_ms3 = millis();
  if (millis()> prev_ms3) 
  {
    if (Altura1+Anchura1 > Altura2+Anchura2)
    {
      if (Color1 == 1)
     {
        //para el verde: pasar por la izquierda
        //setGiro(Posición del servo)
        //Hacer lo del verde
        //Para girar
        //direccionObjetivo = ErrorDireccionActual + 30; //Lo que quieras girar
        if (PosicionX1 >= 150 && Anchura1 >= 10 /*Cuando este bien para girar, y la ancura para lo mismo*/)
        {
          //Girar a la izquierda para ESQUIVAR el bloque
          direccionObjetivo = ErrorDireccionActual + 30;

          Serial.print("Entra en el verde si");
        }
        else if(PosicionX1 <= 150 && Anchura1 <= 23/*Cuando no le de para girar*/)
        {
          //Vuelve atras y volver a empezar la operacion
          Serial.print("Entra en el verde no");
        }
     }

     else if (Color1 == 2)
     {
        //Para el rojo pasar por la derecha
        //Hacer lo del rojo
        Serial.print("Entra en el rojo");
     }
   }

  /*else //el otro es el principal
  {
    if (Color1 == 1)
    {
      //para el verde
    }
    if (Color1 == 2)
    {
      //Para el rojo
    }
  }  */
    prev_ms3 = millis() + 20;
  }

  static uint32_t prev_ms2 = millis();
  if (millis()> prev_ms2) {
    Serial.print(Color1);
    Serial.print(",");
    Serial.print(Color2);
    Serial.print(",");
    Serial.print(Anchura1);
    Serial.print(",");
    Serial.print(Altura1);
    Serial.print(",");
    Serial.print(PosicionY1);
    Serial.print(",");
    Serial.println(PosicionX1);
    prev_ms2 = millis() + 250;

  }

  AnchuraPrevia1 = Anchura1;
  AnchuraPrevia2 = Anchura2;

}