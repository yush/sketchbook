// Determine l'intersection
// A publier, eventuellemnt avec des sliders pour faire varier le rayon des cercles!
// intersection des cercles de rayon 5 et 6
PVector circle = new PVector(20, 15);
final int SIZE = 30;
PVector orig1 = new PVector(0,0);
PVector orig2 = new PVector(0,height);
PVector h; 

void setup() {
  size(400,300, P3D);
  orig1 = new PVector(0,0);
  orig2 = new PVector(0,height);
  h = getCartesianCoordFor(circle);
  println(h);
  noFill();
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  drawCircles(circle);
  fill(255);
  stroke(255,0,255);
  ellipse(h.x, h.y, 10, 10);
  noLoop();
}

void drawCircles(PVector circle) {
  ellipse(0,0, circle.x*SIZE, circle.x*SIZE);
  ellipse(0,height, circle.y*SIZE, circle.y*SIZE);
}

PVector getCartesianCoordFor(PVector aCir) {
    float r0, r1;
    float a1,a0;
    float b;
    float d = dist(orig1.x,orig1.y,orig2.x,orig2.y);
    // on calcule le rayon
    r0 = aCir.x*SIZE/2;
    r1 = aCir.y*SIZE/2;
    // determine la longueur du coté a
    a1 = ((r1*r1)+(d*d)-(r0*r0))/(2*d);
    a0 = ((r0*r0)+(d*d)-(r1*r1))/(2*d);
    // determine la longueur du coté b 
    b = sqrt((r1*r1)-(a1*a1));
    println(b);
    PVector coord = new PVector(0, a0);
    coord.add(new PVector(b, 0));
    return coord;
}

