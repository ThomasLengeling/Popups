byte messageOff[] = {0x42, 0x65, 0x67, 0x0A, 0x02, 0x00, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x00, 0x45, 0x6E, 0x64, 0x06};

byte messageOn[]  = {0x42, 0x65, 0x67, 0x0A, 0x02, 0x00, 0xFF, 0x01, 0x01, 0xFF, 0x01, 0x00, 0x45, 0x6E, 0x64, 0x06};

void setup() {
  Serial.begin(230400);
}

void loop() {
  // put your main code here, to run repeatedly:

  Serial.write(messageOff, sizeof(messageOff));

  Serial.write(messageOn, sizeof(messageOff));

  //off
  //42 65 67 0A 01 00 FF 00 00 45 6E 64 FA

  //0n
  //42 65 67 0A 01 00 FF 01 00 45 6E 64 FA



}
