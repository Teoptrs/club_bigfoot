
Bigfoot myBigfoot;

void setup() {
  fullScreen();
  background(#1593CB);
  myBigfoot = new Bigfoot(width/2, height/2, 1.5);
}

boolean moveUp = false;
boolean moveDown = false;
boolean moveLeft = false;
boolean moveRight = false;

void keyPressed() {
  if (key == 'w') moveUp = true;
  if (key == 's') moveDown = true;
  if (key == 'a') moveLeft = true;
  if (key == 'd') moveRight = true;
}

void keyReleased() {
  if (key == 'w') moveUp = false;
  if (key == 's') moveDown = false;
  if (key == 'a') moveLeft = false;
  if (key == 'd') moveRight = false;
}

void draw() {
  background(#1593CB);
  myBigfoot.drawBigfoot();
  myBigfoot.move();
}

class Bigfoot {

  float bigX, bigY; // world position
  float s;          // scale factor
  boolean dance = true;
  boolean isShot = false;
  boolean armLfront = false;
  boolean armRfront = false;
  boolean armsMoveL = true;
  float armAngle = 0;
  float moveSpeed = 5;
  float danceSpeed = 3;


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

    pushMatrix();
    translate(-60, -40);              // move to shoulder joint
    rotate(radians(armAngle));        // rotate arm around that point
    rect(-10, 0, 20, 130, 10);        // arm left
    popMatrix();

    pushMatrix();
    translate(60, -40);              // move to shoulder joint
    rotate(radians(armAngle));        // rotate arm around that point
    rect(10, 0, -20, 130, 10);        // arm left
    popMatrix();


    fill(#FFE59D);
    rect(5, -53, 5, 7, 10);   // teeth


    fill(#5F3710);

    rect(-15, -55, 30, 4, 10);   // mouth
    rect(-3, -70, 6, 13, 2);   // nose

    popMatrix();
  }


  void move() {

    if (moveLeft&&bigX>=0) {
      bigX-=moveSpeed;
    }

    if (moveRight&&bigX<=width) {
      bigX+=moveSpeed;
    }

    if (moveUp&&bigY>=0) {
      bigY-=moveSpeed;
    }

    if (moveDown&&bigY<=height) {
      bigY+=moveSpeed;
    }


    if (dance) {
      if (armsMoveL) {
        armAngle += danceSpeed;
        if (armAngle >= 50) {
          armsMoveL = false;
        }
      } else {
        armAngle -= danceSpeed;
        if (armAngle <= -50) {
          armsMoveL = true;
        }
      }
    }
  }
}
