Hunter hunter;

void setup(){
  fullScreen();
  hunter = new Hunter(width/2, height);
}


void draw(){
 background(255);
  hunter.display();
  
  
}

class Hunter {

  float x, y;

  Hunter(float x, float y) {
    x = width/2;
    y = height;
  }


  void display() {
    
    //-------shape of head with hair
    pushStyle();
    fill(#A0580B); //hair, back of hunter's head, dark brown
    arc(width/2, height, 200, 200, PI, TWO_PI);
    popStyle();
    
    //-------neck
    pushStyle();
    fill(#FFE9B9);
    arc(width/2, height, 200, 50, PI, TWO_PI);
    
    popStyle();
    
    
    
    //------little strands of hair with curvevertex
    
    //------hat with curvevertex
    pushStyle();
    fill(#2C8913); //base of hat green
    beginShape();
    curveVertex(x - 100, y - 100);
    curveVertex(x- 100, y - 80);
    curveVertex(x - 80, y - 30);
    curveVertex(x + 100, y -100);
    curveVertex(x + 100, y - 100);
    endShape(CLOSE);
    popStyle();

    
    
    //hat ( green with brown rim)
    
    
    
    //feather (abstract and basic shape)
    
    
    
    
    
  }
}
