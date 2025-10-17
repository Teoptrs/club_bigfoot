Hunter hunter;
Bigfoot myBigfoot;
lightManagement lm;

void setup() {
  fullScreen();
  background(#1593CB);

  // Initialize all objects
  hunter = new Hunter(width/2, height);
  myBigfoot = new Bigfoot(width/2, height/2, 1.5);
  lm = new lightManagement();
  lm.newStage();  // start with first batch of lights
}

void draw() {
  background(#1593CB);

  // Draw everything
  
  myBigfoot.drawBigfoot();
  hunter.display();
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

  Bigfoot(float x, float y, float scaleFactor) {
    bigX = x;
    bigY = y;
    s = scaleFactor;
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
    this.x = x;
    this.y = y;
  }

  void display() {
    // Head with hair
    pushStyle();
    fill(#A0580B);
    arc(x, y, 200, 200, PI, TWO_PI);
    popStyle();

    // Neck
    pushStyle();
    fill(#FFE9B9);
    arc(x, y, 200, 50, PI, TWO_PI);
    popStyle();

    // Hat
    pushStyle();
    fill(#2C8913);
    beginShape();
    curveVertex(x - 100, y - 100);
    curveVertex(x - 100, y - 80);
    curveVertex(x - 80, y - 30);
    curveVertex(x + 100, y - 100);
    curveVertex(x + 100, y - 100);
    endShape(CLOSE);
    popStyle();
  }
}
