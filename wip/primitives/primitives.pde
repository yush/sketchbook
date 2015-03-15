/*
 * Tracer une figure perpendiculaire à un vecteur
 */

void setup(){
  size(300,300,OPENGL); 
  stroke(0);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  drawAxis();
  drawCylinder();
}

void drawCylinder() {
 final int NUM_VERT=5;
 final int r1 = 20;
 final int r2 = 55;
 PVector p1,p2;
 beginShape(QUAD_STRIP);
 for (int i=0; i <= NUM_VERT; i++) {
   float angle = 2*PI/NUM_VERT;
   p1 = new PVector(sin(angle*i), 0, cos(angle*i));
   p1.mult(r1);
   p2 = new PVector(sin(angle*i), 0, cos(angle*i));
   p2.mult(r2);
   vertex(p1.x, 0, p1.z);
   vertex(p2.x, 100, p2.z);
 }  
 endShape(); 
}

void drawAxis() {
  final int l=10;
  stroke(255,0,0);
  line(0,0,0,l,0,0);
  stroke(0,255,0);
  line(0,0,0,0,l,0);
  stroke(0,0,255);
  line(0,0,0,0,0,l);
}



