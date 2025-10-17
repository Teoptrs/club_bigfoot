Hunter hunter;
Gun gun;
Bigfoot myBigfoot;
lightManagement lm;

void setup() {
  fullScreen();
  background(#1593CB);

  // Initialize all objects
  hunter = new Hunter(width/2, height);
  gun = new Gun(width/2 - 100, height);
  myBigfoot = new Bigfoot(width/2, height/2, 1.5);
  lm = new lightManagement();
  lm.newStage();  // start with first batch of lights
}


void draw() {
  background(255);
  // Draw everything
  myBigfoot.drawBigfoot();
  hunter.display();
  gun.display();
  lm.drawLights();
  lm.checkTouched(myBigfoot.bigX, myBigfoot.bigY);
}


// ===================== LIGHT MANAGEMENT =====================

class lightManagement {
  int stage;
  ArrayList<light> lights = new ArrayList<light>();

  lightManagement() {
    stage = 1;
  }

  void newStage() {
    lights.clear();
    for (int i = 0; i <= stage; i++) {
      lights.add(new light(
        random(100, width - 100),
        random(100, height - 100),
        color(random(255), random(255), random(255), 180)
      ));
    }
  }
  
  
  void checkTouched(float bx, float by) {
  for (light l : lights) {
    if (l.isTouched(bx, by)) {
      l.isTouched = true;
      if(stageDone()){
        stage++;
        newStage();
        break;
      
      } 
    }
  }
  }

  Boolean stageDone(){
    for(light l : lights) {
      if (!l.isTouched){
        return false;
      }
    }
    return true;
  }
  

  void drawLights() {
    for (light l : lights) {
      l.drawLight();
    }
  }
}


// ===================== LIGHT CLASS =====================

class light {
  float x;
  float y;
  float radius;
  color col;
  boolean isTouched;
  float origin;
  float offset;

  light(float x, float y, color col) {
    this.x = x;
    this.y = y;
    radius = 200;
    this.col = col;
    isTouched = false;
    origin=x+random(-100,100);
    offset=random(10);
  }

  boolean isTouched(float bx, float by) {
    return dist(x, y, bx, by) < radius;
  }

  void drawLight() {
    if(!isTouched){
      fill(col);
      noStroke();
      circle(x, y, radius);
      triangle(origin,-y,x-(radius/2),y,x+(radius/2),y);
      origin=origin+(sin(frameCount*0.1+offset)*10);
    }
  }
}




// ===================== BIGFOOT CLASS =====================

class Bigfoot {
  float bigX, bigY; // world position
  float s;          // scale factor
  boolean dance = false;
  boolean isShot = false;
  boolean armLfront = false;
  boolean armRfront = false;

Bigfoot(float x,float y, float s){
  bigX=x;
  bigY=y;
  this.s=s;
}

  void drawBigfoot() {
    noStroke();
    pushMatrix();
    translate(bigX, bigY);
    scale(s);

    fill(#984E08);
    rect(-30, -30, 60, 100, 30);   // body
    rect(-35, 20, 30, 130, 10);    // left leg
    rect(5, 20, 30, 130, 10);      // right leg
    rect(-50, -40, 100, 30, 10);   // shoulders
    rect(-65, -40, 20, 130, 10);   // left arm
    rect(65, -40, -20, 130, 10);   // right arm
    rect(-20, -80, 40, 40, 30);    // head
    rect(-15, -70, 30, 40, 30);

    popMatrix();
  }
  }


// ===================== HUNTER CLASS =====================

class Hunter {

  float x, y;


  Hunter(float x, float y) {
    this.x = width/2;
    this.y = height;
  }


  void display() {

//--------Head-------//

    pushStyle();
    fill(#A0580B); //hair, back of hunter's head, dark brown
    arc(width/2, height, 200, 200, PI, TWO_PI);
    popStyle();

    //-----hair strands
    pushStyle();
    stroke(0);
    strokeWeight(2);

    //popStyle();

    //-------neck
    pushStyle();
    fill(#FFE9B9);
    arc(width/2, height, 250, 30, PI, TWO_PI);
    popStyle();

//------Hat--------//

    //------hat with curvevertex
    float offset = 50;
    float offset2 = -28;
    float hatScale = 0.55;

    pushStyle();
    fill(#175F02); //base of hat green
    strokeWeight(2);
    beginShape();

    vertex(width/2 - 100, height - 100 + offset);   // left bottom, touches head
    vertex(width/2 - 80, height - 130 + offset);    // left mid
    vertex(width/2 - 40, height - 140 + offset);    // left top curve
    vertex(width/2, height - 145 + offset);         // top-center
    vertex(width/2 + 40, height - 140 + offset);    // right top curve
    vertex(width/2 + 80, height - 130 + offset);    // right mid
    vertex(width/2 + 100, height - 100+ offset);
    endShape(CLOSE);
    popStyle();


    pushStyle();
    fill(#2C8913); 
    strokeWeight(2);
    beginShape();

    vertex(width/2 - 100 * hatScale, height - 100 * hatScale + offset2); // left bottom
    vertex(width/2 - 80 * hatScale, height - 130 * hatScale + offset2); // left mid
    vertex(width/2 - 40 * hatScale, height - 140 * hatScale + offset2); // left top curve
    vertex(width/2, height - 145 * hatScale + offset2); // top-center
    vertex(width/2 + 40 * hatScale, height - 140 * hatScale + offset2); // right top curve
    vertex(width/2 + 80 * hatScale, height - 130 * hatScale + offset2); // right mid
    vertex(width/2 + 100 * hatScale, height - 100 * hatScale + offset2); // right bottom

    endShape(CLOSE);
    popStyle();

//-----Feather----//


    float featherBaseX = width/2;
    float featherBaseY = height - 145 + offset; // adjust to where the layers meet
    float featherLength = 60; // length of the feather
    float featherWidth = 8;   // max width near the base

    beginShape();
    vertex(featherBaseX, featherBaseY); // base
    vertex(featherBaseX + 2, featherBaseY - featherLength * 0.3); // right curve
    vertex(featherBaseX + 1, featherBaseY - featherLength * 0.6); // right mid taper
    vertex(featherBaseX, featherBaseY - featherLength);       // tip
    vertex(featherBaseX - 1, featherBaseY - featherLength * 0.6); // left mid taper
    vertex(featherBaseX - 2, featherBaseY - featherLength * 0.3); // left curve
    vertex(featherBaseX, featherBaseY); // close base
    endShape(CLOSE);
    popStyle();
 }
}
// ===================== GUN CLASS =====================

class Gun {
  
  float x, y;


  Gun(float x, float y) {
    this.x = x;
    this.y = y;
    
    x =  width/2 - 100;
    y = height;
  }
   void display() {
  pushStyle();
  fill(#A75F05);
  rect(x, y - 30 , 50, 5);
  popStyle();
  
  pushStyle();
  fill(##C1BBB4);
  rect(x, y - 30 , 50, 5);
  popStyle();
  
}



    
    
    
  }
}
