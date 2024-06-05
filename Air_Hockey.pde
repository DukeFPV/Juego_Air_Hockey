PShape s;

Puck puck;
RoundedRect roundedRect;

void setup() {
  size(800, 600);
  s = loadShape("bordes.svg");
  roundedRect = new RoundedRect(12.5,12.5,775,575,100,25);  // Table width, height, and corner radius
  puck = new Puck(new PVector(width / 2, height / 2), new PVector(-6.35, 8), 15);  // Puck position, velocity, and radius
}

void draw() {
  background(0);
  fill(200);
  //shape(s, 40, 40, 320, 320);
  roundedRect.display(); // Show the table
  puck.update(); // Update puck's position
  puck.edges(roundedRect); // Check for collisions with edges, passing the table as argument
  puck.show(); // Display the puck
  
  //my_rounded_rect_using_arcs(12.5,12.5,775,575,100,25);
}

void mouseClicked() {

  println("mouseX : " + mouseX + "mouseY : " + mouseY);

}
//void my_rounded_rect_using_arcs(float x0,float y0,float wx,float wy,float r,float strokeW) {
//  ellipseMode(CENTER);
//  noFill();
//  stroke(255);
//  strokeWeight(strokeW);
//  line(x0+r,y0,x0+wx-r,y0);       
//  arc(x0+wx-r,y0+r,2*r,2*r,TWO_PI-HALF_PI,TWO_PI);
//  line(x0+wx,y0+r,x0+wx,y0+wy-r); 
//  arc(x0+wx-r,y0+wy-r,2*r,2*r,0,HALF_PI);
//  line(x0+r,y0+wy,x0+wx-r,y0+wy); 
//  arc(x0+r,y0+wy-r,2*r,2*r,PI-HALF_PI,PI);
//  line(x0,y0+r,x0,y0+wy-r);       
//  arc(x0+r,y0+r,2*r,2*r,PI,PI+HALF_PI);
//  //fill the area between the lines
//  noStroke();
//  rect(x0+r,y0+strokeW/2,wx-2*r,wy-strokeW+1);        
//  rect(x0+strokeW/2,y0+r,wx-strokeW+1,wy-2*r);

//}
/*
  // Here we are moving 5% of the way to the mouse location each frame
  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);*/
