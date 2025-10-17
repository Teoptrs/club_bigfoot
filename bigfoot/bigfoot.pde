Hunter hunter;
Bigfoot myBigfoot;
lightManagement lm;

boolean moveUp = false;
boolean moveDown = false;
boolean moveLeft = false;
boolean moveRight = false;

void setup() {
  fullScreen();
  background(#1593CB);

  hunter = new Hunter(width / 2, height);
  myBigfoot = new Bigfoot(width / 2, height / 2, 1.5);
  lm = new lightManagement();
  lm.newStage();
}

void draw() {
  background(#1593CB);

  // Draw and move Bigfoot
  myBigfoot.drawBigfoot();
  myBigfoot.move();

  // Draw hunter and lights
  hunter.display();
  lm.drawLights();
  lm.checkTouched(myBigfoot.bigX, myBigfoot.bigY);
}

// ===================== KEY INPUT =====================

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
        if (stageDone()) {
          stage++;
          newStage();
          break;
        }
      }
    }
  }

  boolean stageDone() {
    for (light l : lights) {
      if (!l.isTouched) return false;
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
    origin = x + random(-100, 100);
    offset = random(10);
  }

  boolean isTouched(float bx, float by) {
    return dist(x, y, bx, by) < radius;
  }

  void drawLight() {
    if (!isTouched) {
      fill(col);
      noStroke();
      circle(x, y, radius);
      origin += sin(frameCount * 0.1 + offset) * 10;
    }
  }
}


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


// ===================== HUNTER CLASS =====================

class Hunter {
  float x, y;

  Hunter(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    pushStyle();
    fill(#A0580B);
    arc(width / 2, height, 200, 200, PI, TWO_PI);
    popStyle();

    fill(#FFE9B9);
    arc(width / 2, height, 250, 30, PI, TWO_PI);

    // Hat
    float offset = 50;
    float offset2 = -28;
    float hatScale = 0.55;

    pushStyle();
    fill(#175F02);
    strokeWeight(2);
    beginShape();
    vertex(width / 2 - 100, height - 100 + offset);
    vertex(width / 2 - 80, height - 130 + offset);
    vertex(width / 2 - 40, height - 140 + offset);
    vertex(width / 2, height - 145 + offset);
    vertex(width / 2 + 40, height - 140 + offset);
    vertex(width / 2 + 80, height - 130 + offset);
    vertex(width / 2 + 100, height - 100 + offset);
    endShape(CLOSE);
    popStyle();

    pushStyle();
    fill(#2C8913);
    strokeWeight(2);
    beginShape();
    vertex(width / 2 - 100 * hatScale, height - 100 * hatScale + offset2);
    vertex(width / 2 - 80 * hatScale, height - 130 * hatScale + offset2);
    vertex(width / 2 - 40 * hatScale, height - 140 * hatScale + offset2);
    vertex(width / 2, height - 145 * hatScale + offset2);
    vertex(width / 2 + 40 * hatScale, height - 140 * hatScale + offset2);
    vertex(width / 2 + 80 * hatScale, height - 130 * hatScale + offset2);
    vertex(width / 2 + 100 * hatScale, height - 100 * hatScale + offset2);
    endShape(CLOSE);
    popStyle();

    // Feather
    float featherBaseX = width / 2;
    float featherBaseY = height - 145 + offset;
    float featherLength = 60;
    float featherWidth = 8;

    beginShape();
    vertex(featherBaseX, featherBaseY);
    vertex(featherBaseX + 2, featherBaseY - featherLength * 0.3);
    vertex(featherBaseX + 1, featherBaseY - featherLength * 0.6);
    vertex(featherBaseX, featherBaseY - featherLength);
    vertex(featherBaseX - 1, featherBaseY - featherLength * 0.6);
    vertex(featherBaseX - 2, featherBaseY - featherLength * 0.3);
    vertex(featherBaseX, featherBaseY);
    endShape(CLOSE);
  }
}
