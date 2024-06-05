

class Paddle {

  float x;
  float y = height/2;
  float r = 60;
  
  Paddle (boolean left) {
    if (left){
      x = r;
    } else {
      x = width - r;
    }
  }
  
  void show (){
    noStroke();
    fill(205);
    ellipseMode(CENTER);
    ellipse (x, y, r, r);
  
  
  }

}
