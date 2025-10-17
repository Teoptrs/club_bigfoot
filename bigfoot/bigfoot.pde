
Bigfoot myBigfoot;

void setup() {
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
    fill(#5F3710);
    rect(-35, 20, 30, 130, 10);    // left leg
    rect(5, 20, 30, 130, 10);      // right leg

    fill(#984E08);
    rect(-30, -30, 60, 100, 30);   // body
    rect(-60, -40, 120, 40, 10);   // shoulders

    rect(-65, -40, 20, 130, 10);    // left arm
    rect(65, -40, -20, 130, 10);    // right arm

    rect(-20, -90, 40, 45, 30);    // head
    rect(-25, -60, 50, 20, 10);    // jaw

    fill(#000000);
    circle(-10, -70, 9);  //eye left
    circle(10, -70, 9);  //eye left

    fill(#5F3710);
    rect(-18, -75, 15, 3, 5);    // eyebrow left
    rect(18, -75, -15, 3, 5);    // eyebrow left
    rect(-40, -30, 80, 40, 30);    // chest hair

    fill(#984E08);
    rect(-44, 140, 40, 15, 10);    // left foot
    rect(44, 140, -40, 15, 10);    // left foot

    fill(#FFE59D);
    rect(5, -53, 5, 7, 10);   // teeth

    fill(#5F3710);
    rect(-15, -55, 30, 4, 10);   // mouth
    rect(-3, -70, 6, 13, 2);   // nose



    popMatrix();
  }
}
