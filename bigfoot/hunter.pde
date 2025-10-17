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
