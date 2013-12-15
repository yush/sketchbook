ArrayList<PVector> pos;
PVector p;

void initSnake() {
  pos.clear();
  for( int i=0; i < 10; i++) {
    if (i == 0) {
      p = new PVector(0,0);
     }
    else {
      p = new PVector(p.x+random(-0.3,0.3), p.y+random(0.3,0.3));
    }
    pos.add(p.get());
  } 
}

void setup() {
  size(400,400, OPENGL);
  pos = new ArrayList();
  initSnake();
}

void keyPressed() {
  if (key == ' ') {
    initSnake();
  }
}

void draw() {
  background(255);
  stroke(0);
  translate(height/2, width/2); 
//  println(pos.size());
  PVector prev = null;
  for(int i=0; i < pos.size(); i++) {
    p = pos.get(i);
    rotateZ(p.x);
    line(0,0,50,0);
    if ( prev != null) {
      pushMatrix();
      rotateZ(HALF_PI);
      rotateZ(-prev.x/2);
      line(-10,0,10,0);
      popMatrix();
    }
    translate(50, 0); 
    prev = p;
  }
}
