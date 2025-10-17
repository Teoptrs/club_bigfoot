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
