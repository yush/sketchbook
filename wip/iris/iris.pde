/*
 * Tracer une figure perpendiculaire à un vecteur
 */
Flower fleur;

void setup(){
  size(800,600,OPENGL); 
  stroke(0);
  fleur= new Flower();
}

void draw(){
  background(255);
  translate(width/2, height/2);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  drawAxis();
  fleur.draw();
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
