/*
  This is the "LED fuel gauge" code
  
  Analog input, serial output
 
 Reads an analog input pin, prints the results to the serial monitor.
 outputs high voltage signal to 5 different pins based on reading.
 
  
 The circuit:

 (100 ohm) voltage dividing circuit connected to analog pin 0.
 
 LEDs connected to pins 2, 3, 4, 7 and 8

 LEDs come on and stay on as resistance is lowered. - all LEDs lit indicates full tank.
 
Greater than 385 = LED1 blinks (Very empty!!)
less than 385 = LED1 on (empty)
less than 353 = LED2 on
less than 291 = LED3 on
less than 229 = LED4 on
less than 167 = LED5 on (full)
 
 created by Jonathan Henry Williams and everyone who's ever used Arduino
 
 */
int led1 = 2;    // the output pins 
int led2 = 3;     
int led3 = 4;
int led4 = 7;
int led5 = 8;
 
 void setup()
 {
   pinMode(led1, OUTPUT);
   pinMode(led2, OUTPUT);
   pinMode(led3, OUTPUT);
   pinMode(led4, OUTPUT);
   pinMode(led5, OUTPUT);
   
  Serial.begin(9600); 
 }

  
  
 void loop() {
   // read the analog input into a variable:
   int analogValue = analogRead(0);
   // print the result:
  Serial.println(analogValue);
   // wait 10 milliseconds for the analog-to-digital converter
   // to settle after the last reading:
   delay(500);
   
   if ((analogValue>385) && (analogValue<1028) ) {   // 
    digitalWrite(led1, HIGH);   
    delay(500);    // 
    digitalWrite(led1, LOW);
    delay(500); 
 }
 else {
   digitalWrite(led1, LOW);                       // light is off
 }
   
   
   if ((analogValue>0) && (analogValue<354) ) {   // 
    digitalWrite(led1, HIGH);                      // 
 }
 else {
   digitalWrite(led1, LOW);                       // light is off
 }
 
   if ((analogValue>0) && (analogValue<292) ) {  // pin 0 reads 2nd resistor only - 268ohm - beige
    digitalWrite(led2, HIGH);                       // fan goes on!
 }
 else {
   digitalWrite(led2, LOW);                         // fan is off
 }
 
 if ((analogValue>0) && (analogValue<230) ) {   // pin 0 reads both resistors in parallel
    digitalWrite(led3, HIGH);
                         //   
 }
 else {
   digitalWrite(led3, LOW);                         // 
 }
 if ((analogValue>0) && (analogValue<168) ) {   // pin 0 reads both resistors in parallel
    digitalWrite(led4, HIGH);
                         //   
 }
 else {
   digitalWrite(led4, LOW);                         // 
 }
 if ((analogValue>0) && (analogValue<106) ) {   // pin 0 reads both resistors in parallel
    digitalWrite(led5, HIGH);
                         //   
 }
 else {
   digitalWrite(led5, LOW);                         // 
 }
 
 }
   
 
