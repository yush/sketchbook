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
  box(10);
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

