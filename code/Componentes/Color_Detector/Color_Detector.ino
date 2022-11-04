int s0 = 3, s1 = 4, s2 = 5, s3 = 6;
int out = 2;
int flag = 0;
byte counter = 0;
byte countR = 0, countG = 0, countB = 0;

void setup()
 {
 Serial.begin(115200);
 pinMode(s0,OUTPUT);
 pinMode(s1,OUTPUT);
 pinMode(s2,OUTPUT);
 pinMode(s3,OUTPUT);

 }

void TCS()
 {
 flag=0;
 digitalWrite(s0,HIGH);
 digitalWrite(s1,HIGH);
 digitalWrite(s2,LOW);
 digitalWrite(s3,LOW);
 attachInterrupt(0, ISR_INTO, CHANGE);
 timer0_init();

 }
void ISR_INTO()
 {
 counter++;
 }
 void timer0_init(void)
 {
  TCCR2A=0x00;
  TCCR2B=0x07;   //the clock frequency source 1024 points
  TCNT2= 100;    //10 ms overflow again
  TIMSK2 = 0x01; //allow interrupt
 }
 int i=0;
 ISR(TIMER2_OVF_vect)//the timer 2, 10ms interrupt overflow again. Internal overflow interrupt executive function
{
    static uint32_t prev_ms = millis();
    TCNT2=100;
    flag++;
 if(flag==1)
  {
    countR = counter;
    Serial.print("Muestreo: ");
    uint32_t Muestreo = millis() - prev_ms;
    Serial.print(Muestreo);
    Serial.print("\t");
    if (countR < 50) {
      Serial.print("BLUE");
      Serial.print("\t");
      }
    Serial.print("red=");
    Serial.println(countR,DEC);
    prev_ms = millis();
    digitalWrite(s2,LOW);
    digitalWrite(s3,HIGH);
  }
  
   else if(flag==2)
    {
    countB=counter;
    Serial.print("Muestreo: ");
    uint32_t Muestreo = millis() - prev_ms;
    Serial.print(Muestreo);
    Serial.print("\t");
    if (countB < 50) {
      Serial.print("RED");
      Serial.print("\t");
      }
    Serial.print("blue=");
    Serial.println(countB,DEC);
    Serial.println("\n");
    prev_ms = millis();
    digitalWrite(s2,LOW);
    digitalWrite(s3,LOW);
    }
    else if(flag==3)
     {
     flag=0;
     }
       counter=0;
}
void loop()
 {
  TCS();
while(1);
 }
