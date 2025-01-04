
const int buzzer = 2; //buzzer to arduino pin 9

void setup(){
  pinMode(buzzer, OUTPUT); // Set buzzer - pin 9 as an output
  Serial.begin(115200);
}

void loop(){
  single_beep();
  delay(1000);
}

void single_beep(){
  tone(buzzer, 4000); // Send 1KHz sound signal...
  delay(50);        // ...for 1 sec
  noTone(buzzer);     // Stop sound...
}

void double_beep(){
  tone(buzzer, 100); // Send 1KHz sound signal...
  delay(50);        // ...for 1 sec
  noTone(buzzer);     // Stop sound...
  delay(50);        // ...for 1 sec
  tone(buzzer, 100); // Send 1KHz sound signal...
  delay(50);        // ...for 1 sec
  noTone(buzzer);     // Stop sound...
  delay(50);        // ...for 1 sec
  
}

void freq_sweep(){
  int freq=0;
  while(freq<10000){
  tone(buzzer, freq); // Send 1KHz sound signal...
  delay(50);        // ...for 1 sec
  noTone(buzzer);     // Stop sound...
  freq=freq+100;
  delay(1000);        // ...for 1 sec
  Serial.print("Freq: ");
  Serial.println(freq);
  }

}