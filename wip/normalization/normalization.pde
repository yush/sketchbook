/*
 * Tracer une figure perpendiculaire à un vecteur
 */
PVector p1, n1, rot;
PMatrix test;

void setup(){
  size(800,600,OPENGL); 
  stroke(0);
  p1 = new PVector(0.5,1,0);
  p1.mult(100);
  n1 = p1.get();
  n1.normalize();
  showVector(p1);
  showVector(n1);
  rot = new PVector(acos(n1.y), acos(n1.z), acos(n1.x));
  PVector showRot = rot.get();
  showRot.mult(360/(2*PI));
  showVector(showRot);
}


void draw(){
  background(255);
  translate(width/2, height/2);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  drawAxis();
  stroke(0);
  line(0,0,0,p1.x,p1.y,p1.z);
  stroke(0,255,255);
  pushMatrix();
  rotateX(rot.x);
  rotateY(rot.y);
  rotateZ(rot.z);
  line(0,0,0,0,p1.mag(),0);
  popMatrix();
}

void drawAxis() {
  final int l=100;
  fill(0);
  stroke(255,0,0);
  line(0,0,0,l,0,0);
  text("x", l*1.1, 0,0);
  stroke(0,255,0);
  line(0,0,0,0,l,0);
  text("y", 0, l*1.1,0);
  stroke(0,255,0);
  line(0,0,0,0,0,l);
  text("z", 0, 0, l*1.1);

}


void showVector(PVector v) {
  println("x:"+v.x+" y:"+v.y+" z:"+v.z);
}

