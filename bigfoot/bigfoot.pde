lightManagement lm;

void setup(){
 fullScreen(); 
 lm = new lightManagement();
}

class lightManagement{
  int stage;
  ArrayList<light> lights = new ArrayList<light>();
  
  lightManagement(){
   stage=1;
  }
  
 void newStage(){
    lights.clear();
    for(int i=0; i<=stage; i++){
      
      lights.add(new light(
      random(20,width-20),
      random(20,height-20),
      color(random(255),random(255),random(255),180)));
    }
  
  }
}

class light{
 float x;
 float y;
 float radius;
 color col;
 Boolean istouched;
 
  light(float x, float y, color col){
   this.x=x;
   this.y=y;
   radius=50;
   this.col=col;
   istouched=false;
   
  }
  Boolean isTouched(){
    
    if(radius>dist(x,y,x,y)){ //add character coordinates later when implemented
      return true; 
    }
    else
    {
      return false;
    }
  }
  void drawLight(){
    fill(col);
    circle(x,y,40);
  }
    
}
