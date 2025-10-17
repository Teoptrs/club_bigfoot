class Hunter {

  float x, y;


  Hunter(float x, float y) {
    this.x = width/2;
    this.y = height;
  }


  void display() {

//--------Head-------//

    pushStyle();
    fill(#A0580B); //hair, back of hunter's head, dark brown
    arc(width/2, height, 200, 200, PI, TWO_PI);
    popStyle();

    //-----hair strands
    pushStyle();
    stroke(0);
    strokeWeight(2);

    //popStyle();

    //-------neck
    pushStyle();
    fill(#FFE9B9);
    arc(width/2, height, 250, 30, PI, TWO_PI);
    popStyle();

//------Hat--------//

    //------hat with curvevertex
    float offset = 50;
    float offset2 = -28;
    float hatScale = 0.55;

    pushStyle();
    fill(#175F02); //base of hat green
    strokeWeight(2);
    beginShape();

    vertex(width/2 - 100, height - 100 + offset);   // left bottom, touches head
    vertex(width/2 - 80, height - 130 + offset);    // left mid
    vertex(width/2 - 40, height - 140 + offset);    // left top curve
    vertex(width/2, height - 145 + offset);         // top-center
    vertex(width/2 + 40, height - 140 + offset);    // right top curve
    vertex(width/2 + 80, height - 130 + offset);    // right mid
    vertex(width/2 + 100, height - 100+ offset);
    endShape(CLOSE);
    popStyle();


    pushStyle();
    fill(#2C8913); 
    strokeWeight(2);
    beginShape();

    vertex(width/2 - 100 * hatScale, height - 100 * hatScale + offset2); // left bottom
    vertex(width/2 - 80 * hatScale, height - 130 * hatScale + offset2); // left mid
    vertex(width/2 - 40 * hatScale, height - 140 * hatScale + offset2); // left top curve
    vertex(width/2, height - 145 * hatScale + offset2); // top-center
    vertex(width/2 + 40 * hatScale, height - 140 * hatScale + offset2); // right top curve
    vertex(width/2 + 80 * hatScale, height - 130 * hatScale + offset2); // right mid
    vertex(width/2 + 100 * hatScale, height - 100 * hatScale + offset2); // right bottom

    endShape(CLOSE);
    popStyle();

//-----Feather----//


    float featherBaseX = width/2;
    float featherBaseY = height - 145 + offset; // adjust to where the layers meet
    float featherLength = 60; // length of the feather
    float featherWidth = 8;   // max width near the base

    beginShape();
    vertex(featherBaseX, featherBaseY); // base
    vertex(featherBaseX + 2, featherBaseY - featherLength * 0.3); // right curve
    vertex(featherBaseX + 1, featherBaseY - featherLength * 0.6); // right mid taper
    vertex(featherBaseX, featherBaseY - featherLength);       // tip
    vertex(featherBaseX - 1, featherBaseY - featherLength * 0.6); // left mid taper
    vertex(featherBaseX - 2, featherBaseY - featherLength * 0.3); // left curve
    vertex(featherBaseX, featherBaseY); // close base
    endShape(CLOSE);
    popStyle();

  }
}


// ===================== CROSSHAIR CLASS ====================
class Crosshair {
  //coordinates are based on location of bigfoot, it follows him.

void drawCrosshair() {
  pushStyle();
  stroke(255,0, 0); //red crosshair
  strokeWeight(2);
  noFill();
  
  line(myBigfoot.bigX - 20, myBigfoot.bigY, myBigfoot.bigX + 20, myBigfoot.bigY);
  line(myBigfoot.bigX, myBigfoot.bigY - 20, myBigfoot.bigX, myBigfoot.bigY + 20);
  popStyle();
  
}
}
