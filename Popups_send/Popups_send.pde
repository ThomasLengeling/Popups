import processing.serial.*;
import controlP5.*;

import java.util.Vector;

//GUI
ControlP5 cp5;

//SERIAL
Serial myPort;  // Create object from Serial class
boolean portConnected = true;
String portName = "/dev/ttyUSB1";

int val;      // Data received from the serial port
boolean got;

//PUMPS
PumpManager mPumps;


//random values
int texSize = 12;

boolean canSend = false;

int rings[] = {1, 12, 24, 24};

void setup() {
  size(1024, 768);
  smooth(8);
  textSize(texSize);

  //Serial setup
  println(Serial.list());

  try {
    myPort = new Serial(this, portName, 9600);
  }
  catch(Exception e) {
    println("could not connect to port: "+portName);
    portConnected = false;
  }

  //Pumps Setup
  mPumps = new PumpManager();
  int counter = 0;
  for (int i = 0; i < rings.length; i++) {
    for (int j = 1; j <= rings[i]; j++) {
      int id = counter;
      int type = i + 1;
      int speed = 0;
      int distance = 100;
      color light = color(0, 100, 155);
      float rad = i*100;
      float step = (TWO_PI/rings[i]);
     
      float x = sin( j*step )*rad + width/2.0; 
      float y = cos( j*step )*rad + height/2.0;
      
      Pump p = new Pump(id, distance, speed, light);
      p.setLocation(x, y);
      p.setType(type);
      mPumps.add(p);
      counter++;
    }
  }


  //froutain
  setupFoutain();

  //GUI setup
  setupGUI();
}

void draw() {
  background(0);  

  if (portConnected) {// Set background to white
    serialUpdate();
  }
  
  
  mPumps.draw();
  mPumps.activate(currentPad);

  fill(255);
  text("connected to "+portName, 50, 20);
}