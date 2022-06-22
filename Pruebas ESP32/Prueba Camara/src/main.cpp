#include <Arduino.h>
#include <Pixy2.h>
#include <Wire.h>

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

void setGiro(int posicionServo){
  Wire.beginTransmission(4);
  Wire.write(4);
  Wire.write(posicionServo);
  Wire.endTransmission();
  Serial.println(posicionServo);
}

void setup() {
  // put your setup code here, to run once:

  pixy.init();
  Serial.begin(115200);

}

void loop() {
  // put your main code here, to run repeatedly:

  setGiro(0);

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

  AnchuraPrevia1 = Anchura1;
  AnchuraPrevia2 = Anchura2;

  if (AnchuraPrevia1 == Anchura1)
  {
    if (AnchuraPrevia1 == Anchura1)
    {
      Anchura1 = 0;
    }
  }

  if (AnchuraPrevia2 == Anchura2)
  {
    if (AnchuraPrevia2 == Anchura2)
    {
      Anchura2 = 0;
    }
  }

  if (Altura1+Anchura1 > Altura2+Anchura2)
  {
    if (Color1 == 1)
    {
      //para el verde: pasar por la izquierda
      //setGiro(Posición del servo)
      while (Color1 == 1)
      {
        setGiro(-20);
        Serial.println("Ha entrado!!!!");
      }
    }
    if (Color1 == 2)
    {
      //Para el rojo pasar por la derecha
      while (Color1 == 1)
      {
        setGiro(20);
      }
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

}