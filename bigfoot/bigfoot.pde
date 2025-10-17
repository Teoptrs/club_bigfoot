
Bigfoot myBigfoot;

void setup(){
  fullScreen();
  background(#1593CB);
  myBigfoot = new Bigfoot(width/2, height/2, 1.5);
}
void draw() {
  background(#1593CB);
  myBigfoot.drawBigfoot();
}


class Bigfoot {

  float bigX, bigY; // world position
  float s;          // scale factor
  boolean dance = false;
  boolean isShot = false;
  boolean armLfront = false;
  boolean armRfront = false;

  Bigfoot(float x, float y, float scaleFactor) {
    bigX = x;
    bigY = y;
    s = scaleFactor;
  }

  void drawBigfoot() {
    noStroke();

    pushMatrix();
    translate(bigX, bigY);  // Move to Bigfoot’s position on screen
    scale(s);               // Apply scale relative to that position

    // Draw centered Bigfoot around 0,0
    fill(#984E08);
    rect(-30, -30, 60, 100, 30);   // body
    rect(-35, 20, 30, 130, 10);    // left leg
    rect(5, 20, 30, 130, 10);      // right leg
    rect(-50, -40, 100, 30, 10);   // shoulders
    rect(-65, -40, 20, 130, 10);    // left arm
    rect(65, -40, -20, 130, 10);    // right arm
    
     rect(-20, -80, 40, 40, 30);    // head
     rect(-15, -70, 30, 40, 30);
     
    
    popMatrix();
  }

class light{
 float x;
 float y;
 float radius;
 
  light(float x, float y, float radius){
   this.x=x;
   this.y=y;
   this.radius=radius;
  }
  Boolean isTouched(){
    
    if(dist(x,y,x,y){ //add bigfoot coordinates
      return true;
      
    }else{
      return false;
    }
}
