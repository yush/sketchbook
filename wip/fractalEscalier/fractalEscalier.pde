
/*
 * Tracer une figure perpendiculaire à un vecteur
 */
int MAX_SIZE=400;
float angle;
int ITERATION = 60;
color col1, col2;
void setup(){
  size(400,400, P2D); 
  stroke(0);
  noFill();
  angle = (4*PI/180);
  float rectSize = MAX_SIZE;
  col1 = 0;//color(220,125,235);
  col2 = 0;//color(250,245,10);
  background(255);
  for (int i = 0; i < ITERATION; i++) {
    //rect(0,0,rectSize,rectSize);
    beginShape();
    stroke(col1);
    vertex(0,0);
    stroke(col2);
    vertex(0,rectSize);
    stroke(col1);
    vertex(rectSize,rectSize);
    stroke(col2);
    vertex(rectSize,0);
    endShape(CLOSE);

    translate(0,sin(angle)*rectSize);
    rotate(-angle);
    rectSize = rectSize-(angle*rectSize);
  }

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

