class Puck {
  PVector position;
  PVector velocity;
  float radius;

  Puck(PVector position, PVector velocity, float radius) {
    this.position = position;
    this.velocity = velocity;
    this.radius = radius;
  }

  void update() {
    position.add(velocity);
  }

  void edges(RoundedRect table) {
    if (table.checkCollision(position, radius)) {
      // Reverse velocity upon collision
      velocity.x *= -1;
      velocity.y *= -1;
    }
  }

  void show() {
    fill(255);
    ellipse(position.x, position.y, radius * 2, radius * 2);
  }
}
