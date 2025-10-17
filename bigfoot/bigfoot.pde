Hunter hunter;

void setup() {
  fullScreen();
  hunter = new Hunter(width/2, height);
}


void draw() {
  background(255);
  hunter.display();
}

class Hunter {

  float x, y;


  Hunter(float x, float y) {
    this.x = width/2;
    this.y = height;
  }


  void display() {

    //-------shape of head with hair
    pushStyle();
    fill(#A0580B); //hair, back of hunter's head, dark brown
    arc(width/2, height, 200, 200, PI, TWO_PI);
    popStyle();

    //-----hair strands
    pushStyle();
    stroke(0);
    strokeWeight(2);

    ////will fix this part later
    ////----left side strand
    //beginShape();
    //curveVertex(x - 60, y - 100);
    //curveVertex(x - 80, y - 60);
    //curveVertex(x - 70, y - 30);
    //curveVertex(x - 70, y - 30);
    //endShape(CLOSE);

    ////----right side strand
    //beginShape();
    //curveVertex(x + 60, y - 100);
    //curveVertex(x + 80, y - 60);
    //curveVertex(x + 70, y - 30);
    //curveVertex(x + 70, y - 30);
    //endShape(CLOSE);

    //popStyle();

    //-------neck
    pushStyle();
    fill(#FFE9B9);
    arc(width/2, height, 250, 30, PI, TWO_PI);

    popStyle();




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

    //----light green second level
    pushStyle();
    fill(#2C8913); //red top
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



    //hat ( green with brown rim)



    //feather (abstract and basic shape)
  }
}
