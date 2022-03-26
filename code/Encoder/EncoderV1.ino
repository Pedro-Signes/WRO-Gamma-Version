const byte interruptPin = 2;
long encoder = 0;
bool forward = false;


void setup() {
  // put your setup code here, to run once:
  pinMode(interruptPin, INPUT);
  attachInterrupt(digitalPinToInterrupt(interruptPin), encoderISR, CHANGE);
  Serial.begin(115200);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println(encoder);
}

void encoderISR() {
  if (forward == true) 
  {
    encoder ++;
  }
  else
  {
    encoder --;
  }
  
}
