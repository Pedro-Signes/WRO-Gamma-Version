#include <SoftwareSerial.h>

#define EN 3
#define RX 12
#define TX 11
SoftwareSerial BTSerial(TX, RX); // CONNECT BT RX PIN TO ARDUINO 11 PIN | CONNECT BT TX PIN TO ARDUINO 10 PIN

void setup() 
{
  pinMode(EN, OUTPUT);  // this pin will pull the HC-05 pin 34 (key pin) HIGH to switch module to AT mode
  digitalWrite(EN, HIGH); 
  Serial.begin(115200);
  //Serial.println("Enter AT commands:");
  BTSerial.begin(115200);  // HC-05 default speed in AT command more
}

void loop()
{

  // Keep reading from HC-05 and send to Arduino Serial Monitor
  if (BTSerial.available())
    Serial.write(BTSerial.read());

  // Keep reading from Arduino Serial Monitor and send to HC-05
  if (Serial.available())
    BTSerial.write(Serial.read());
}
