// ===================== BIGFOOT CLASS =====================

class Bigfoot {
  float bigX, bigY;
  float s;
  boolean dance = true;
  boolean isShot = false;
  boolean armLfront = false;
  boolean armRfront = false;
  boolean armsMoveL = true;
  float armAngle = 0;
  float moveSpeed = 5;
  float danceSpeed = 3;

  Bigfoot(float x, float y, float s) {
    bigX = x;
    bigY = y;
    this.s = s;
  }

  void drawBigfoot() {
    noStroke();
    pushMatrix();
    translate(bigX, bigY);
    scale(s);

    fill(#5F3710);
    rect(-35, 20, 30, 130, 10);
    rect(5, 20, 30, 130, 10);

    fill(#984E08);
    rect(-30, -30, 60, 100, 30);
    rect(-60, -40, 120, 40, 10);

    rect(-20, -90, 40, 45, 30);
    rect(-25, -60, 50, 20, 10);

    fill(#000000);
    circle(-10, -70, 9);
    circle(10, -70, 9);

    fill(#5F3710);
    rect(-18, -75, 15, 3, 5);
    rect(18, -75, -15, 3, 5);
    rect(-40, -30, 80, 40, 30);

    fill(#984E08);
    rect(-44, 140, 40, 15, 10);
    rect(44, 140, -40, 15, 10);

    pushMatrix();
    translate(-60, -40);
    rotate(radians(armAngle));
    rect(-10, 0, 20, 130, 10);
    popMatrix();

    pushMatrix();
    translate(60, -40);
    rotate(radians(armAngle));
    rect(10, 0, -20, 130, 10);
    popMatrix();

    fill(#FFE59D);
    rect(5, -53, 5, 7, 10);

    fill(#5F3710);
    rect(-15, -55, 30, 4, 10);
    rect(-3, -70, 6, 13, 2);

    popMatrix();
  }

  void move() {
    if (moveLeft && bigX >= 0) bigX -= moveSpeed;
    if (moveRight && bigX <= width) bigX += moveSpeed;
    if (moveUp && bigY >= 0) bigY -= moveSpeed;
    if (moveDown && bigY <= height) bigY += moveSpeed;

    if (dance) {
      if (armsMoveL) {
        armAngle += danceSpeed;
        if (armAngle >= 50) armsMoveL = false;
      } else {
        armAngle -= danceSpeed;
        if (armAngle <= -50) armsMoveL = true;
      }
    }
  }
}
