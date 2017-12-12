

import processing.serial.*;

int linefeed = 10; // new line ASCII = 10
Serial myPort;

int value1 = 0; //this variable will contain the 

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
  myPort.bufferUntil(linefeed);
}

void draw () 
{ 
  //do something with "value1"
}

void serialEvent (Serial myPort) 
{
  // read serial buffer as string
  String myString = myPort.readString();

  // if we have any other bytes than linefeed
  if (myString != null) 
  {
    // trim crap
    myString = trim(myString);
    value1 = int(myString); //make string to integer
    println(value1);
  }
  
}