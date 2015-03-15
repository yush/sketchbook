int LG=120;
int iter=2;

void setup() {
  size(600,400,OPENGL);
  background(0);
  stroke(255);
  translate(width/2, height/2);
  drawFlocon(1);
}

void draw() {
  drawFlocon();
  translate(LG,0,0);
  rotateZ(-PI/3);
  drawFlocon();
  translate(LG,0,0);
  rotateZ(2*PI/3);
  drawFlocon();
  translate(LG,0,0);
  rotateZ(-PI/3);
  drawFlocon();
}

void drawFlocon(int iter, int LG) {
  if (iter = 1) {
    line(0,0,LG,0); 
  } else {
    line(0,0,LG/3,0);
    translate(LG/3,0,0);
    rotateZ(-PI/3);
    line(0,0,LG/3,0);
    translate(LG/3,0,0);
    rotateZ(2*PI/3);
    line(0,0,LG/3,0);
    translate(LG/3,0,0);
    rotateZ(-PI/3);
    line(0,0,LG/3,0);
  }
}
