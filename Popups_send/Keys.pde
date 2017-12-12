void keyPressed() {
  if (key == '1') {
    circlePump();
  }
  if (key == '2') {
    stopPump();
  }
  if (key == '3') {
    runPump();
  }
  if (key == '4') {
    goPump();
  }
  if (key == '5') {
    fastPump();
  }
  if (key == '6') {
    jumpPump();
  }
  if (key == '7') {
    colorsPump();
  }
  if (key == '8') {
    randomPump();
  }

  if (key =='a') {
    canSend = true;
    println(canSend);
  }

  if (key == 'z') {
    serialFountain.write(messageOm_0);
    println("sent on 0");
  }

  if (key == 'x') {
    serialFountain.write(messageOff_0);
    println("sent off 0 ");
  }

  if (key == 'c') {
    serialFountain.write(messageOn_1);
    println("sent on 1");
  }

  if (key == 'v') {
    serialFountain.write(messageOff_1);
    println("sent off 1 ");
  }

  if (key == 'b') {
    serialFountain.write(messageOn_2);
    println("sent on 2");
  }

  if (key == 'n') {
    serialFountain.write(messageOff_2);
    println("sent off 2 ");
  }

  if (key == 'm') {
    serialFountain.write(messageOn_3);
    println("sent on 3");
  }

  if (key == ',') {
    serialFountain.write(messageOff_3);
    println("sent off 3 ");
  }

  if (key == 'l') {
    serialFountain.write(messageOff);
    println("sent off All ");
  }
  
}