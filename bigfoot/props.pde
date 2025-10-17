class AllTheProps {
  DanceFloor floor;
  DiscoBall ball;

  AllTheProps() {
    floor = new DanceFloor();
    ball = new DiscoBall();
  }

  void drawAll() {
    stroke(0);
    strokeWeight(4);
    floor.drawDanceFloor();
    ball.drawBall();
  }
  

class DanceFloor {
  color[] colors = { // Our disco color selection
    #001BEF, #7CD4FF, #FFF325, #FF36A5, #6FFD3E, #6800BC
  };

  int time;
  float squareSize;
  color[][] danceSquares;

  DanceFloor() {
    squareSize = width / 8;
    int cols = int(width / squareSize);
    int rows = int(height / squareSize);

    danceSquares = new color[cols][rows];
    randomizeAllColors();
    time = 0;
  }


  void drawDanceFloor() {
    // Update all colors every ~45 frames
    if (time > 45) {
      randomizeAllColors();
      time = 0;
    } else {
      time++;
    }

    // Draw all squares
    for (int x = 0; x < danceSquares.length; x++) {
      for (int y = 0; y < danceSquares[0].length; y++) {
        fill(danceSquares[x][y]);
        square(x * squareSize, y * squareSize, squareSize);
      }
    }
  }

  void randomizeAllColors() {
    for (int x = 0; x < danceSquares.length; x++) {
      for (int y = 0; y < danceSquares[0].length; y++) {
        danceSquares[x][y] = randomColor();
      }
    }
  }

  color randomColor() {
    int index = int(random(colors.length));
    return colors[index];
  }
}

class DiscoBall {
  float angle;
  color[] colors = { // Our disco color selection
    #001BEF, #7CD4FF, #FFF325, #FF36A5, #6FFD3E, #6800BC
  };

  DiscoBall() {
    angle = 0;
  }

  void drawBall() {
    //hanging string
    stroke(200);
    line(width / 2, 0, width / 2, height / 4 - 50);
    stroke(1);

    pushMatrix();
    translate(width / 2, height / 6);
    rotate(radians(angle));
    fill(#E0E0E0);
    ellipse(0, 0, width/13, width/13);

    noStroke();
    for (int i = 0; i<360; i = i + 30) {
      fill(#E0E0E0, 200);
      pushMatrix();                   // isolate rotation for each beam
      rotate(radians(i));
      triangle(0, 0, -width/10, 3*height/4+0.5*width, width/10, 3*height/4+0.5*width);
      popMatrix();                    // reset rotation
    }
    stroke(1);
    popMatrix();
    angle -= 1; // rotation
  }
}
}
