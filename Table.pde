class Mesa {
  float x0, y0, wx, wy, r, strokeW;

  Mesa(float x0, float y0, float wx, float wy, float r, float strokeW) {
    this.x0 = x0;
    this.y0 = y0;
    this.wx = wx;
    this.wy = wy;
    this.r = r;
    this.strokeW = strokeW;
  }

  void display() {
    imageMode(CORNER);
    image(mesa, 112.5, 13, 1000, 675);
    pushMatrix();
    translate(103, height/2-90 + 83/2);
    rotate(radians(270));
    imageMode(CENTER);
    image(porteria, 0, 0, 250, 83);
    popMatrix();

    pushMatrix();
    translate(1123, height/2-90 + 83/2);
    rotate(radians(90));
    imageMode(CENTER);
    image(porteria, 0, 0, 250, 83);
    popMatrix();

    noFill();
    strokeWeight(5);
    stroke(225, 10, 10, 170);
    ellipse(width/2, height/2-50, 150, 150);
    line(width/2, 425, width/2, 670);
    line(width/2, 15, width/2, 275);
    stroke(10, 10, 220, 170);
    arc(1100, height/2-50, 180, 180, HALF_PI, PI+HALF_PI);
    arc(135, height/2-50, 180, 180, PI+HALF_PI, TWO_PI+HALF_PI);

    stroke(255);
    strokeWeight(strokeW);
    line(x0, y0, x0, 240);
    line(x0, 460, x0, y0 + wy);
    line(x0 + wx, y0, x0 + wx, 240);
    line(x0 + wx, 460, x0 + wx, y0 + wy);
    line(x0, y0, x0 + wx, y0);
    line(x0, y0 + wy, x0 + wx, y0 + wy);
  }

  PVector checkCollision(PVector position, float radius) {
    PVector normal = null;

    if (position.y - radius + radius/2 < y0 + strokeW + r) normal = new PVector(0, -1);//Arriba
    
    if (position.y + radius + radius/2 > y0 + wy - strokeW) normal = new PVector(0, 1);//Abajo
    
    if (position.x - radius + radius/2 < x0 + strokeW) normal = new PVector(-1, 0); //Derecha
    
    if (position.x + radius + radius/2 > x0 + wx - strokeW) normal = new PVector(1, 0); //Izquierda
    
    return normal;
  }
}
//  // Para bordes redondeados (No funciona)
//  PVector cornerNormal = checkCornerCollision(new PVector(x0 + r/2, y0 + r/2), position, radius, PI, PI + HALF_PI);  // Esquina Top-left 
//  if (cornerNormal != null) normal = cornerNormal;
//  cornerNormal = checkCornerCollision(new PVector(x0 + r/2, y0 + wy - r/2), position, radius, PI - HALF_PI, PI);  // Esquina Bottom-left
//  if (cornerNormal != null) normal = cornerNormal;
//  cornerNormal = checkCornerCollision(new PVector(x0 + wx - r/2, y0 + wy - r/2), position, radius, 0, HALF_PI);  // Esquina Bottom-right
//  if (cornerNormal != null) normal = cornerNormal;
//  cornerNormal = checkCornerCollision(new PVector(x0 + wx - r/2, y0 + r/2), position, radius, TWO_PI - HALF_PI, TWO_PI);  // Esquina Top-right
//  if (cornerNormal != null) normal = cornerNormal;

//  return normal;
//}


  //PVector checkCornerCollision(PVector corner, PVector position, float radius, float startAngle, float endAngle) {
  //  float distToCorner = PVector.dist(position, corner);
  //  if (distToCorner < r + radius) {
  //    float angle = atan2(position.y - corner.y, position.x - corner.x);
  //    if (angle < 0) angle += TWO_PI;
  //    if (angle >= startAngle && angle <= endAngle) {
  //      PVector normal = PVector.sub(position, corner);
  //      normal.normalize();
  //      return normal;
  //    }
  //  }
  //  return null;
  //}
