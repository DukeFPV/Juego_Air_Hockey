class Paddle {
  PVector position;
  PVector mousePosition;
  float r;
  float dFriction = 0.005;
  float ychange;
  float easing = 0.05;
  boolean controlRaton;

  Paddle(boolean isLeft, boolean controlRaton) {
    r = 50;
    position = new PVector(isLeft ? r : width - r, height / 2);
    mousePosition = new PVector(position.x, position.y);    
    ychange = 0;
    this.controlRaton = controlRaton;
  }

  void update() {
    if (controlRaton) {
      if (PVector.dist(mousePosition, new PVector(mouseX, mouseY)) > 0.1) {
        mousePosition.x += (mouseX - mousePosition.x) * easing;
        mousePosition.y += (mouseY - mousePosition.y) * easing;
      }
      mousePosition.x = constrain(mousePosition.x, 125 + r, height - r - 175);
      mousePosition.y = constrain(mousePosition.y, 100 - r/2, 675 - r);
    }

    fill(255);
    ellipse(mousePosition.x, mousePosition.y, r, r);
    // Update position to mousePosition
    position = mousePosition.copy();

  }

  void show() {
    
  }

void checkCollision(Puck puck) {
  // Get distances between the paddle and the puck
  PVector distanceVect = PVector.sub(puck.position, position);

  // Calculate magnitude of the vector separating the paddle and the puck
  float distanceVectMag = distanceVect.mag();

  // Minimum distance before they are touching
  float minDistance = r+r/2 + puck.radius;

  if (distanceVectMag < minDistance) {
    float distanceCorrection = (minDistance-distanceVectMag)/2.0;
    PVector d = distanceVect.copy();
    PVector correctionVector = d.normalize().mult(distanceCorrection);
    puck.position.add(correctionVector);

    // get angle of distanceVect
    float theta  = distanceVect.heading();
    // precalculate trig values
    float sine = sin(theta);
    float cosine = cos(theta);

    /* this paddle's position is relative to the puck
     so you can use the vector between them (distanceVect) as the 
     reference point in the rotation expressions. */
    PVector bTemp = new PVector();

    bTemp.x  = cosine * distanceVect.x + sine * distanceVect.y;
    bTemp.y  = cosine * distanceVect.y - sine * distanceVect.x;

    // rotate Temporary velocities
    PVector vTemp = new PVector();

    vTemp.x  = cosine * puck.velocity.x + sine * puck.velocity.y;
    vTemp.y  = cosine * puck.velocity.y - sine * puck.velocity.x;

    /* Now that velocities are rotated, you can use 1D
     conservation of momentum equations to calculate 
     the final velocity along the x-axis. */
    PVector vFinal = new PVector();

    // final rotated velocity for paddle
    vFinal.x = ((dFriction - puck.dFriction) * vTemp.x + 2 * puck.dFriction * puck.velocity.x) / (dFriction + puck.dFriction);
    vFinal.y = vTemp.y;

    // hack to avoid clumping
    bTemp.x += vFinal.x;

    /* Rotate paddle positions and velocities back
     Reverse signs in trig expressions to rotate 
     in the opposite direction */
    // rotate paddle
    PVector bFinal = new PVector();

    bFinal.x = cosine * bTemp.x - sine * bTemp.y;
    bFinal.y = cosine * bTemp.y + sine * bTemp.x;

    // update velocities
    puck.velocity.x = cosine * vFinal.x - sine * vFinal.y;
    puck.velocity.y = cosine * vFinal.y + sine * vFinal.x;
  }
}
}
