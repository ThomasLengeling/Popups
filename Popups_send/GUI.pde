String [] padNames = {"circlePump", "stopPump", "runPump", "goPump", "fastPump", "jumpPump", "colorsPump", "randomPump"};

void setupGUI() {
  cp5 = new ControlP5(this); 

  for (int i=0; i < padNames.length; i++) {
    cp5.addBang(padNames[i])
      .setPosition(30, 40 + i * 70)
      .setSize(40, 40)
      .setId(i)
      ;
  }
}

void circlePump() {
  println(padNames[0]);
  serialFountain.write(messageOm_0);
  //serialFountain.write(messageOn);
  println("sent on");
}

void stopPump() {
  serialFountain.write(messageOff_0);
  //serialFountain.write(messageOff);
  println("sent off");
  println(padNames[1]);
}

void runPump() {
  println(padNames[2]);
}

void goPump() {
  println(padNames[3]);
}

void fastPump() {
  println(padNames[4]);
}

void jumpPump() {
  println(padNames[5]);
}

void colorsPump() {
  println(padNames[6]);
}

void randomPump() {
  println(padNames[7]);
}