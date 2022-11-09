#include <Arduino.h>
#include <Wire.h>

#define PinLaserF 3
#define PinLaserD 4
#define PinLaserI 5
#define PinColorOut 6
#define PinColorS0 7
#define PinColorS1 8
#define PinColorS2 9
#define PinColorS3 10

bool ReadingLaserF = false;   // Indica si se esta leyendo el Laser Frontal
bool ReadingLaserD = false;   // Indica si se esta leyendo el laser Derecho
bool ReadingLaserI = false;   // Indica si se esta leyendo el laser Izquierdo
int outputLaserF; // micros
int outputLaserD; // micros
int outputLaserI; // micros
volatile uint32_t prev_mcs_laserF;
volatile uint32_t prev_mcs_laserD;
volatile uint32_t prev_mcs_laserI;

uint8_t requestedData = 0;

void receiveEvent(int howMany);
void requestEvent();

void medirLaserF() {
  uint32_t mcs = micros();
  if (digitalRead(PinLaserF)) {
    prev_mcs_laserF = mcs;
    ReadingLaserF = true;
  } else if (ReadingLaserF) {
    outputLaserF = mcs - prev_mcs_laserF;
    ReadingLaserF = false;
  }
}
void medirLaserD() {
  uint32_t mcs = micros();
  if (digitalRead(PinLaserD)) {
    prev_mcs_laserD = mcs;
    ReadingLaserD = true;
  } else if (ReadingLaserD) {
    outputLaserD = mcs - prev_mcs_laserD;
    ReadingLaserD = false;
  }
}
void medirLaserI() {
  uint32_t mcs = micros();
  if (digitalRead(PinLaserI)) {
    prev_mcs_laserI = mcs;
    ReadingLaserI = true;
  } else if (ReadingLaserI) {
    outputLaserI = mcs - prev_mcs_laserI;
    ReadingLaserI = false;
  }
}


void setup() {
  // put your setup code here, to run once:

  Serial.begin(115200);
  Serial.println("Serial a punto");

  Wire.begin(5);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Wire.onRequest(requestEvent); // register event

  pinMode(PinLaserF, OUTPUT);
  pinMode(PinLaserD, OUTPUT);
  pinMode(PinLaserI, OUTPUT);
  attachInterrupt(digitalPinToInterrupt(PinLaserF), medirLaserF, CHANGE);
  attachInterrupt(digitalPinToInterrupt(PinLaserD), medirLaserD, CHANGE);
  attachInterrupt(digitalPinToInterrupt(PinLaserI), medirLaserI, CHANGE);

}

void loop() {
  // put your main code here, to run repeatedly:

}

void receiveEvent(int howMany) {
  requestedData = Wire.read();
}

void requestEvent() {
  if (requestedData == 1) {
    Wire.write(outputLaserF);
    Wire.write(outputLaserD);
    Wire.write(outputLaserI);
  }
}