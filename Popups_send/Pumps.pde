/*
class includes the commands to activate a single water pump
 
 */

class Pump {
  int id;
  int speed;
  int distance;
  color lightColor;
  int type;
 

  //for visualization porposes.
  float x;
  float y;
  float tam = 30;

  //boolean activate
  boolean enabelePump;
  boolean sendCommand;

  Pump(int id, int distance, int speed, color lightColor) {
    this.id = id;
    this.speed = speed;
    this.distance = distance;
    this.lightColor = lightColor;
  }

  void setLocation(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setType(int type){
   this.type = type; 
  }


  void sendCommand() {
  }
  


  void draw() {

    noFill();
    stroke(lightColor);
    strokeWeight(15);
    ellipse(x, y, tam, tam);

    noStroke();
    if (enabelePump) {
      fill(200, 0, 0, 250);
    } else {
      fill(250, 250);
    }

    ellipse(x, y, tam, tam);
    
    fill(0);
    text(""+id, x - texSize/2.0, y + texSize/2.0);
  }
  
}