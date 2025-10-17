Hunter hunter;
Bigfoot myBigfoot;
lightManagement lm;
AllTheProps props;


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
  frameRate(60);
  props = new AllTheProps();
}

void draw() {
  background(0);
  props.drawAll();


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
