// ===================== LIGHT MANAGEMENT =====================

class lightManagement {
  int stage;
  ArrayList<light> lights = new ArrayList<light>();
  int stageStartTime;    // track when this stage started
  int stageTimeLimit = 10000; // 10 seconds in milliseconds

  lightManagement() {
    stage = 1;
    stageStartTime = millis(); // initialize timer
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
    stageStartTime = millis(); // reset timer at new stage
  }


  void checkTouched(float bx, float by) {
  for (light l : lights) {
    if (l.isTouched(bx, by) && !l.isTouched) { // only trigger once
      l.isTouched = true;

      // make Bigfoot dance for 2 seconds
      myBigfoot.dance = true;
      myBigfoot.danceStartTime = millis();

      if (stageDone()) {
        stage++;
        newStage();
        break;
        }
      }
    }
  }


  void checkTime() {
    if (millis() - stageStartTime > stageTimeLimit) {
      println("Time's up! Game over.");
      
      exit(); // closes the program
    }
  }
  
  int getRemainingTime() {
  int elapsed = millis() - stageStartTime;
  int remaining = stageTimeLimit - elapsed;
  return max(0, remaining); // never go below 0
  }
  
  
  void displayTimer() {
    stroke(0);
    strokeWeight(4);
  fill(255);             // white color
  textSize(64);          // bigger text
  textAlign(LEFT, BOTTOM);
  
  // get remaining time in seconds with one decimal
  float secondsLeft = getRemainingTime() / 1000.0;
  
  // display with one decimal
  text("Time: " + nf(secondsLeft, 2, 2), 20, height - 20);
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
