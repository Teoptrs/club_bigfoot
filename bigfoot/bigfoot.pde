
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
  if (key == 'd') moveRight = false;
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
  boolean armLfront = true;
  boolean armRfront = false;
  boolean armsMoveL = true;
  float armAngle = 0;
  float moveSpeed = 5;
  float danceSpeed = 3;
  float bodyAngle = 0;
  float legAngle = 0;
  float raisBrow = 0;  //raise ayebrows
  float squint = 0;   //close eyes


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

    if (armLfront&&armRfront || !armLfront&&!armRfront) {

      fill(#5F3710);

      pushMatrix();
      translate(-20, 150);
      rotate(radians(legAngle));
      rect(-15, 0, 30, -130, 10);    // left leg
      popMatrix();

      pushMatrix();
      translate(20, 150);
      rotate(radians(legAngle));
      rect(15, 0, -30, -130, 10);    // left leg
      popMatrix();

      fill(#984E08);

      pushMatrix();
      translate(0, -30);
      rotate(radians(bodyAngle));
      rect(-30, 0, 60, 100, 30);   // body
      popMatrix();

      rect(-60, -40, 120, 40, 10);   // shoulders

      fill(#5F3710);
      rect(-40, -30, 80, 40, 30);    // chest hair

      stroke(#5F3710);
      fill(#984E08);

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
    } else if (!armLfront&&armRfront) {

      stroke(#5F3710);
      fill(#984E08);
      pushMatrix();
      translate(-60, -40);              // move to shoulder joint
      rotate(radians(armAngle));        // rotate arm around that point
      rect(-10, 0, 20, 130, 10);        // arm left
      popMatrix();

      noStroke();
      fill(#5F3710);
      pushMatrix();
      translate(-20, 150);
      rotate(radians(legAngle));
      rect(-15, 0, 30, -130, 10);    // left leg
      popMatrix();

      pushMatrix();
      translate(20, 150);
      rotate(radians(legAngle));
      rect(15, 0, -30, -130, 10);    // left leg
      popMatrix();

      fill(#984E08);

      pushMatrix();
      translate(0, -30);
      rotate(radians(bodyAngle));
      rect(-30, 0, 60, 100, 30);   // body
      popMatrix();

      rect(-60, -40, 120, 40, 10);   // shoulders

      fill(#5F3710);
      rect(-40, -30, 80, 40, 30);    // chest hair

      stroke(#5F3710);
      fill(#984E08);

      pushMatrix();
      translate(60, -40);              // move to shoulder joint
      rotate(radians(armAngle));        // rotate arm around that point
      rect(10, 0, -20, 130, 10);        // arm right
      popMatrix();
    } else if (armLfront&&!armRfront) {

      stroke(#5F3710);
      fill(#984E08);

      pushMatrix();
      translate(60, -40);              // move to shoulder joint
      rotate(radians(armAngle));        // rotate arm around that point
      rect(10, 0, -20, 130, 10);        // arm right
      popMatrix();

      noStroke();
      fill(#5F3710);
      pushMatrix();
      translate(-20, 150);
      rotate(radians(legAngle));
      rect(-15, 0, 30, -130, 10);    // left leg
      popMatrix();

      pushMatrix();
      translate(20, 150);
      rotate(radians(legAngle));
      rect(15, 0, -30, -130, 10);    // left leg
      popMatrix();

      fill(#984E08);

      pushMatrix();
      translate(0, -30);
      rotate(radians(bodyAngle));
      rect(-30, 0, 60, 100, 30);   // body
      popMatrix();

      rect(-60, -40, 120, 40, 10);   // shoulders

      fill(#5F3710);
      rect(-40, -30, 80, 40, 30);    // chest hair




      stroke(#5F3710);
      fill(#984E08);
      pushMatrix();
      translate(-60, -40);              // move to shoulder joint
      rotate(radians(armAngle));        // rotate arm around that point
      rect(-10, 0, 20, 130, 10);        // arm left
      popMatrix();
    }


    noStroke();
    fill(#984E08);
    rect(-44, 140, 40, 15, 10);    // left foot
    rect(44, 140, -40, 15, 10);    // left foot

    rect(-20, -90, 40, 45, 30);    // head
    rect(-25, -60, 50, 20, 10);    // jaw

    fill(#000000);
    ellipse(-10, -70, 9, 9-squint);  //eye left
    ellipse(10, -70, 9, 9-squint);  //eye left

    fill(#5F3710);
    rect(-18, -75-raisBrow, 15, 3, 5);    // eyebrow left
    rect(18, -75-raisBrow, -15, 3, 5);    // eyebrow left

    noStroke();
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
      raisBrow=5;
      squint=6;
      if (armsMoveL) {
        armAngle += danceSpeed;
        bodyAngle -= 0.5;
        legAngle +=0.4;
        if (armAngle >= 50) {
          armsMoveL = false;
          armLfront = !armLfront;
          armRfront = !armRfront;
        }
      } else {
        armAngle -= danceSpeed;
        bodyAngle += 0.5;
        legAngle -=0.4;
        if (armAngle <= -50) {
          armsMoveL = true;
          armLfront = !armLfront;
          armRfront = !armRfront;
        }
      }
    }
    if (!dance) {
      raisBrow=0;
      squint=0;
    }
  }
}
