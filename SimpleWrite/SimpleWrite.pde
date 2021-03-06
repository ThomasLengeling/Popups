/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

//13-15, 127
byte messageOff_01[] = {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x02, (byte)0x00, (byte)0xFF, (byte)0x00, (byte)0x01, (byte)0xFF, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x06};
byte messageOn_01[]  = {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x02, (byte)0x00, (byte)0xFF, (byte)0x01, (byte)0x01, (byte)0xFF, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x06};

//byte messageOff[]  = {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x03, (byte)0x0D, (byte)0x7F, (byte)0x00, (byte)0x0E, (byte)0x7F, (byte)0x00, (byte)0x0F, (byte)0x7F, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x75};
//byte messageOn[]   = {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x03, (byte)0x0D, (byte)0x7F, (byte)0x01, (byte)0x0E, (byte)0x7F, (byte)0x01, (byte)0x0F, (byte)0x7F, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x74};

//int messageOff[]   = {0x89, 0x65, 0x41, 0x07, 0xE3, 0x60, 0x07, 0x00, 0x87, 0xF4};
//byte messageOn[]   = {0x81, 0x65, 0x41, 0x07, 0xE3, 0x60, 0x07, 0x00, 0x87, 0xF4};

//no me acuerdo que velocidad necesito
//byte messageOn[]  =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x04, (byte)0x0D, (byte)0xB4, (byte)0x01, (byte)0x0E, (byte)0xB4, (byte)0x01, (byte)0x0F, (byte)0xB4, (byte)0x01, (byte)0x10, (byte)0xB4, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x1D};
//byte messageOff[] =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x04, (byte)0x0D, (byte)0x00, (byte)0x00, (byte)0x0E, (byte)0x00, (byte)0x00, (byte)0x0F, (byte)0x00, (byte)0x00, (byte)0x10, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x1D};

//
//byte messageOn[]  =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x04, (byte)0x0D, (byte)0xB4, (byte)0x01, (byte)0x0E, (byte)0xB4, (byte)0x01, (byte)0x0F, (byte)0xB4, (byte)0x01, (byte)0x10, (byte)0xB4, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x1D};
//byte messageOff[] =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x04, (byte)0x0D, (byte)0x00, (byte)0x00, (byte)0x0E, (byte)0x00, (byte)0x00, (byte)0x0F, (byte)0x00, (byte)0x00, (byte)0x10, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x1D};


byte headerBegin[] = {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A};
byte headerEnd[]   =  {(byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x47};


byte headerOff[]   =  {(byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x46};


//13-17, 75
byte messageOn[]  =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x05, (byte)0x0D, (byte)0x4B, (byte)0x01, (byte)0x0E, (byte)0x4B, (byte)0x01, (byte)0x0F, (byte)0x4B, (byte)0x01, (byte)0x10, (byte)0x4B, (byte)0x01, (byte)0x11, (byte)0x4B, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x47};
byte messageOff[] =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x05, (byte)0x0D, (byte)0x4B, (byte)0x00, (byte)0x0E, (byte)0x4B, (byte)0x00, (byte)0x0F, (byte)0x4B, (byte)0x00, (byte)0x10, (byte)0x4B, (byte)0x00, (byte)0x11, (byte)0x4B, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x46};



Serial myPort;  // Create object from Serial class
boolean portConnected = true;
String portName = "/dev/ttyUSB2";
int bauRate = 230400;

byte valvulas[] = {13, 14, 15, 16, 17};

byte sendCommandOn[];
byte sendCommandOff[];

void setup() 
{
  size(200, 200);

  try {
    myPort = new Serial(this, portName, bauRate);
    println("connected to "+portName+" "+bauRate);
  }
  catch(Exception e) {
    println("could not connect to port: "+portName);
    portConnected = false;
  }

  createOn();
  createOff();
}


void draw() {
  background(255);
}

void keyPressed() {
  if (key == '1') {
    for (int i = 0; i < messageOff.length; i++) {
      myPort.write(messageOff[i]);
    }
    println("sent off");
  }
  if (key == '2') {

    for (int i = 0; i < messageOn.length; i++) {
      myPort.write(messageOn[i]);
    }

    println("sent on");
  }

  if (key == '3') {
    myPort.write(messageOff);
    println("sent off");
  }
  if (key == '4') {
    myPort.write(messageOn);
    println("sent on");
  }

  if (key == '5') {
    myPort.write(sendCommandOn);
    println("sent off");
  }
  if (key == '6') {
    myPort.write(sendCommandOff);
    println("sent on");
  }
}