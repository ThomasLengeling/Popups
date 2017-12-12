/**
 * Simple Write. 
 * 
 * Check if the mouse is over a rectangle and writes the status to the serial port. 
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

//13-16
//byte messageOn[]  =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x04, (byte)0x0D, (byte)0xB4, (byte)0x01, (byte)0x0E, (byte)0xB4, (byte)0x01, (byte)0x0F, (byte)0xB4, (byte)0x01, (byte)0x10, (byte)0xB4, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x1D};
//byte messageOff[] =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x04, (byte)0x0D, (byte)0x00, (byte)0x00, (byte)0x0E, (byte)0x00, (byte)0x00, (byte)0x0F, (byte)0x00, (byte)0x00, (byte)0x10, (byte)0x00, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x1D};

byte headerBegin[] = {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A};
byte headerEnd[]   =  {(byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x47};

//13-17, 75
byte messageOn[]  =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x05, (byte)0x0D, (byte)0x4B, (byte)0x01, (byte)0x0E, (byte)0x4B, (byte)0x01, (byte)0x0F, (byte)0x4B, (byte)0x01, (byte)0x10, (byte)0x4B, (byte)0x01, (byte)0x11, (byte)0x4B, (byte)0x01, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x47};
byte messageOff[] =  {(byte)0x42, (byte)0x65, (byte)0x67, (byte)0x0A, (byte)0x05, (byte)0x0D, (byte)0x4B, (byte)0x00, (byte)0x0E, (byte)0x4B, (byte)0x00, (byte)0x0F, (byte)0x4B, (byte)0x00, (byte)0x10, (byte)0x4B, (byte)0x00, (byte)0x11, (byte)0x4B, (byte)0x00, (byte)0x00, (byte)0x45, (byte)0x6E, (byte)0x64, (byte)0x46};


byte valvulas[] = {13, 14, 15, 16, 17};

byte sendCommandOn[];
byte sendCommandOff[];


void setup() 
{
  size(200, 200);

  for (int i = 0; i < messageOn.length; i++) {
    print(messageOn[i]);
    print(" ");
  }

  println();

  for (int i = 0; i < messageOff.length; i++) {
    print(messageOff[i]);
    print(" ");
  }

  //4 4,  1 15,  +1
  println( );

  println(headerBegin.length );
  println(headerEnd.length );

  println( );
  println( messageOn.length);
  println( messageOff.length);

  println( );
  println();
  
  //13-18
  print(byte(0x1C));
  
  //13-19
  print(byte(0x0F));
  print(byte(0x0E));
  
  
  
  
  
  createOn();
  createOff();



  for (int i = 13; i <= 17; i++) {
    byte hexValue = byte(i);
    println(hexValue);
  }
}


void draw() {
  background(255);
}