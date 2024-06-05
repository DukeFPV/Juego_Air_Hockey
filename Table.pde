class RoundedRect {
  float x0, y0, wx, wy, r, strokeW;

  RoundedRect(float x0, float y0, float wx, float wy, float r, float strokeW) {
    this.x0 = x0;
    this.y0 = y0;
    this.wx = wx;
    this.wy = wy;
    this.r = r;
    this.strokeW = strokeW;
  }

  void display() {
    ellipseMode(CENTER);
    noFill();
    stroke(255);
    strokeWeight(strokeW);
    line(x0 + r, y0, x0 + wx - r, y0);
    arc(x0 + wx - r, y0 + r, 2 * r, 2 * r, TWO_PI - HALF_PI, TWO_PI);
    line(x0 + wx, y0 + r, x0 + wx, y0 + wy - r);
    arc(x0 + wx - r, y0 + wy - r, 2 * r, 2 * r, 0, HALF_PI);
    line(x0 + r, y0 + wy, x0 + wx - r, y0 + wy);
    arc(x0 + r, y0 + wy - r, 2 * r, 2 * r, PI - HALF_PI, PI);
    line(x0, y0 + r, x0, y0 + wy - r);
    arc(x0 + r, y0 + r, 2 * r, 2 * r, PI, PI + HALF_PI);

    // Fill the area between the lines
    noStroke();
    rect(x0 + r, y0 + strokeW / 2, wx - 2 * r, wy - strokeW + 1);
    rect(x0 + strokeW / 2, y0 + r, wx - strokeW + 1, wy - 2 * r);
  }

  boolean checkCollision(PVector position, float radius) {
    // Check for collisions with straight edges
    if (position.x + radius > x0 + r && position.x - radius < x0 + wx - r) {
      if (position.y - radius < y0 + strokeW / 2) return true; // Top edge
      if (position.y + radius > y0 + wy - strokeW / 2) return true; // Bottom edge
    }
    if (position.y + radius > y0 + r && position.y - radius < y0 + wy - r) {
      if (position.x - radius < x0 + strokeW / 2) return true; // Left edge
      if (position.x + radius > x0 + wx - strokeW / 2) return true; // Right edge
    }

    // Check for collisions with rounded corners
    if (checkCornerCollision(new PVector(x0 + r/2, y0 + r/2), position, radius, PI, PI + HALF_PI) ||  // Top-left corner
        checkCornerCollision(new PVector(x0 + r/2, y0 + wy - r/2), position, radius, PI - HALF_PI, PI) ||  // Bottom-left corner
        checkCornerCollision(new PVector(x0 + wx - r/2, y0 + wy - r/2), position, radius, 0, HALF_PI) ||  // Bottom-right corner
        checkCornerCollision(new PVector(x0 + wx - r/2, y0 + r/2), position, radius, TWO_PI - HALF_PI, TWO_PI)) {  // Top-right corner
      return true;
    }

    return false;
  }

  boolean checkCornerCollision(PVector corner, PVector position, float radius, float startAngle, float endAngle) {
    float distToCorner = PVector.dist(position, corner);
    if (distToCorner < r + radius) {
      float angle = atan2(position.y - corner.y, position.x - corner.x);
      if (angle < 0) angle += TWO_PI;
      if (angle >= startAngle && angle <= endAngle) {
        return true;
      }
    }
    return false;
  }
}
