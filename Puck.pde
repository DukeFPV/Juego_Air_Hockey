class Puck {
  PVector position;
  PVector velocity;
  float radius;
  float dFriction;

  Puck(PVector position, PVector velocity, float radius, float dFriction) {
    this.position = position;
    this.velocity = velocity;
    this.radius = radius;
    this.dFriction = dFriction;
  }

  void update() {
    velocity.mult(1 - dFriction); // Apply friction to velocity
    position.add(velocity);
  }

  void reflect(PVector normal) {
    float dot = velocity.dot(normal);
    velocity.sub(PVector.mult(normal, 2 * dot));
  }

  void edges(Mesa table) {
    PVector normal = table.checkCollision(position, radius);
    if (normal != null) {
      println(normal);
      reflect(normal);
    }
  }

  void show() {
    fill(255);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
 
  
}
