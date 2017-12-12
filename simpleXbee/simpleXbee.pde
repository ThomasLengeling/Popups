

import processing.serial.*;

int linefeed = 10; // new line ASCII = 10
Serial myPort;

int value1 = 0; //this variable will contain the 

int padNumber = 0;

String portName = "/dev/ttyUSB1";
void setup () {
  size(800, 600);
  // change port!
  try {
    myPort =  new Serial(this, portName, 9600);
  }
  catch(Exception e) {
    println("could not connect to port: "+portName);
  }

  // here we're saying that we need to buffer until 'NEW LINE'
  // myPort.bufferUntil(linefeed);
}

void draw () 
{ 
  background(0);
  //do something with "value1"

  if ( myPort.available() > 0) {  // If data is available,
    int val = myPort.read();         // read it and store it in val

    if (val == 97) {
      padNumber = 1;
    }

    if (val == 72) {
      padNumber = 2;
    }

    if (val == 81) {
      padNumber = 3;
    }

    if (val == 197) {
      padNumber = 4;
    }

    println(val);
  }

  fill(255, 0, 0);
  if (padNumber == 1) {
    rect(50, 50, 50, 50);
    padNumber = 0;
    println("got 1"); //7
  }

  if (padNumber ==2) {
    rect(150, 50, 50, 50);
    padNumber = 0;
    println("got 2");//3
  }

  if (padNumber == 3) {
    rect(250, 50, 50, 50);
    padNumber = 0;
    println("got 3"); //5
  }
}