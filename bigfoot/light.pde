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
      triangle(origin,-y,x-(radius/2),y,x+(radius/2),y);
      circle(x, y, radius);
      origin += sin(frameCount * 0.1 + offset) * 10;
    }
  }
}
