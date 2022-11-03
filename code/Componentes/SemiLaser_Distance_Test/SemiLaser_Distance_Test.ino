// Example Arduino program for reading the Pololu Distance Sensor with Pulse Width Output, 130cm Max
 
// Change this to match the Arduino pin connected to the sensor's OUT pin.
const uint8_t sensorPin = 3;

void setup()
{
  Serial.begin(115200);
}
 
void loop()
{
  static uint32_t prev_ms = millis();
  int16_t t = pulseIn(sensorPin, HIGH);
  uint32_t muestreo = millis() - prev_ms;

  if (t == 0)
  {
    // pulseIn() did not detect the start of a pulse within 1 second.
    Serial.println("timeout");
  }
  else if (t > 1850)
  {
    // No detection.
    Serial.println(-1);
  }
  else
  {
    // Valid pulse width reading. Convert pulse width in microseconds to distance in millimeters.
    int16_t d = (t - 1000) * 2;
 
    // Limit minimum distance to 0.
    if (d < 0) { d = 0; } 
  
    Serial.print(d);
    Serial.println(" mm");
  }
  Serial.print(";");
  Serial.print("\t");
  Serial.print(muestreo);
  Serial.println(" ms");
  prev_ms = millis();
}
/*

#define sensorPin = 3;

void setup()
{
  Serial.begin(115200);
}
 
void loop()
{
  int16_t t = pulseIn(sensorPin, HIGH);

  if (t == 0)
  {
    // pulseIn() did not detect the start of a pulse within 1 second.
    Serial.println("timeout");
  }
  else if (t > 1850)
  {
    // No detection.
    Serial.println(-1);
  }
  else
  {
    // Valid pulse width reading. Convert pulse width in microseconds to distance in millimeters.
    int16_t d = (t - 1000) * 2;
 
    // Limit minimum distance to 0.
    if (d < 0) { d = 0; } 
  
    Serial.print(d);
    Serial.println(" mm");
  }
}*/
