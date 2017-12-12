void createOn(){
  int start = 13;
  int end   = 17;

  int numVals = (end - start) + 1;
  int numValsValues = numVals * 3;
  int numPumps = 1;


  println("numero ");
  int numBytes = headerBegin.length + headerEnd.length +  numPumps + 1 + numValsValues;
  println(numBytes);
  println(" ");

  sendCommandOn = new byte[numBytes];

  for (int i = 0; i < headerBegin.length; i++) {
    sendCommandOn[i] = headerBegin[i];
  }
  sendCommandOn[headerBegin.length] =  byte(numVals);


  for (int j = 0; j < valvulas.length; j++) {
    sendCommandOn[headerBegin.length + 1 + j*3 + 0] =  valvulas[j];
    sendCommandOn[headerBegin.length + 1 + j*3 + 1] =  byte(75);
    sendCommandOn[headerBegin.length + 1 + j*3 + 2] =  byte(1);
  }

  sendCommandOn[ headerBegin.length + numValsValues + numPumps] = byte(0);

  for (int i = 0; i < headerEnd.length; i++) {
    sendCommandOn[  headerBegin.length + numValsValues + numPumps + 1 + i ] = headerEnd[i];
  }

  println("real ");
  for (int i = 0; i < messageOn.length; i++) {
    print(messageOn[i]);
    print(" ");
  }
  println();

  println("created ");

  for (int i = 0; i < sendCommandOn.length; i++) {
    print(sendCommandOn[i]);
    print(" ");
  }
  println("num :"+ sendCommandOn.length);
  println();
  
}

void createOff(){
  int start = 13;
  int end   = 17;

  int numVals = (end - start) + 1;
  int numValsValues = numVals * 3;
  int numPumps = 1;


  println("numero ");
  int numBytes = headerBegin.length + headerEnd.length +  numPumps + 1 + numValsValues;
  println(numBytes);
  println(" ");

  sendCommandOff = new byte[numBytes];

  for (int i = 0; i < headerBegin.length; i++) {
    sendCommandOff[i] = headerBegin[i];
  }
  sendCommandOff[headerBegin.length] =  byte(numVals);


  for (int j = 0; j < valvulas.length; j++) {
    sendCommandOff[headerBegin.length + 1 + j*3 + 0] =  valvulas[j];
    sendCommandOff[headerBegin.length + 1 + j*3 + 1] =  byte(75);
    sendCommandOff[headerBegin.length + 1 + j*3 + 2] =  byte(0);
  }

  sendCommandOn[ headerBegin.length + numValsValues + numPumps] = byte(0);

  for (int i = 0; i < headerEnd.length; i++) {
    sendCommandOff[  headerBegin.length + numValsValues + numPumps + 1 + i ] = headerOff[i];
  }

  println("real ");
  for (int i = 0; i < messageOff.length; i++) {
    print(messageOff[i]);
    print(" ");
  }
  println();

  println("created ");

  for (int i = 0; i < sendCommandOff.length; i++) {
    print(sendCommandOff[i]);
    print(" ");
  }
  println("num :"+ sendCommandOff.length);
  println();
  
  
}