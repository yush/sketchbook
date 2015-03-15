final static int NUM_LINE = 100;
float offset = 3;
final static float LINE_WIDTH = 3;

void setup() {
  size(400,400, OPENGL);
  smooth();
  stroke(0);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  boxMoire();
}

void drawGrid(int gridSize) {
  int numLine = round(gridSize/(offset+LINE_WIDTH));
  beginShape(QUADS);
  for( int i = 0; i < numLine*2; i+=2){
    vertex(i*offset,0,0);
    vertex(i*offset,gridSize,0);
    vertex(i*offset+LINE_WIDTH,gridSize,0);
    vertex(i*offset+LINE_WIDTH,0,0);
  }  
  endShape();
}

void boxMoire() {
  translate(-50,-50,-50);
  drawGrid(100);
  translate(0,0,100);
  drawGrid(100);
  rotateY(HALF_PI);
  drawGrid(100);
  translate(0,0,100);
  drawGrid(100);
}
