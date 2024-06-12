//PShape s;

PImage mesa, porteria;

Paddle left, right;
Puck puck;
Mesa tablero;

void setup() {
  size(1225, 800);
  //s = loadShape("bordes.svg");
  
  left = new Paddle(true, true);
  right = new Paddle(false, false);
  
  tablero = new Mesa(125, 25, 975, 650, 0, 25);  // Table width, height, and corner radius
  puck = new Puck(new PVector(width / 2, height / 2), new PVector(-8.35, 8), 7.5, 0.005);  // Puck position, velocity, and radius
  
  mesa = loadImage("mesa.png");
  porteria = loadImage("porteria.png");
}

void draw() {
  background(0);
  fill(200);
  
  tablero.display(); // Mostrar la mesa de juego
  puck.update(); // Actualizar la posición del puck
  puck.edges(tablero); // Comprueba las colisiones con los bordes, pasando la mesa como argumento
  puck.show(); // Mostrar el disco
 
    // Check for collisions
  left.checkCollision(puck);
  right.checkCollision(puck);
 
  left.show();
  right.show();
  left.update();
  right.update();
  
//  println("Puck position: " + puck.position);
//println("Left paddle position: " + left.position);
//println("Right paddle position: " + right.position);

  }

void mouseClicked() {
  println("mouseX : " + mouseX + "mouseY : " + mouseY);
}

//void keyReleased() {
//  left.move(0);
//  right.move(0);
//}

//void keyPressed() {
//  println(key);
//  if (key == 'A') {
//    left.move(-10);
//  } else if (key == 'Z') {
//    left.move(10);
//  }

//  if (key == 'J') {
//    right.move(-10);
//  } else if (key == 'M') {
//    right.move(10);
//  }
//}

/*
  // Here we are moving 5% of the way to the mouse location each frame
  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);*/
