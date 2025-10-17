//how to play: use wasd to move around, get into all the lights to dance in less than 7 seconds or get shoot by the hunter!



Hunter hunter;
Bigfoot myBigfoot;
lightManagement lm;
AllTheProps props;
DiscoMusic music;
Crosshair crosshair;


boolean moveUp = false;
boolean moveDown = false;
boolean moveLeft = false;
boolean moveRight = false;

void setup() {
  fullScreen();
  background(#1593CB);
  music = new DiscoMusic(this);


  hunter = new Hunter(width / 2, height);
  myBigfoot = new Bigfoot(width / 2, height / 2, 1.5);
  lm = new lightManagement();
  lm.newStage();
  frameRate(60);
  props = new AllTheProps();
  crosshair = new Crosshair();
}

void draw() {
  background(0);
  props.drawAll();
  lm.displayTimer();
  lm.checkTime();
  
  music.update();


  // Draw and move Bigfoot
  myBigfoot.drawBigfoot();
  myBigfoot.move();

  // Draw hunter and lights
  hunter.display();
  lm.drawLights();
  lm.checkTouched(myBigfoot.bigX, myBigfoot.bigY);
  crosshair.drawCrosshair();
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
