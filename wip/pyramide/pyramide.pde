ArrayList<PVector> points;
float r=1;
ArrayList<Triangle> temp;

void setup() {
  size(400, 300, OPENGL);
  points = new ArrayList();
  PVector a=new PVector(r, 0, 0);
  PVector b=new PVector(0, r, 0);
  PVector c=new PVector(-r, 0, 0);
  PVector d=new PVector(0, -r, 0);     
  PVector e=new PVector(0, 0, r);
  points.add(a);
  points.add(b);
  points.add(c);
  points.add(d);
  points.add(e);


  for (PVector v : points) v.mult(100);

  temp = new ArrayList();
  temp.add(new Triangle(a, b, e));  
  temp.add(new Triangle(b, c, e));  
  temp.add(new Triangle(c, d, e));  
  temp.add(new Triangle(d, a, e));
}

void draw() {
  background(128);
  translate(width/2, height/2, 0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  for (Triangle t:temp) {
    beginShape(TRIANGLES);
    color(random(255));    
    vertex(t.a.x, t.a.y, t.a.z);
    vertex(t.b.x, t.b.y, t.b.z);
    vertex(t.c.x, t.c.y, t.c.z);
    endShape();
  }
}

