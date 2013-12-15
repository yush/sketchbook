import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RPolygon p;
RShape s;

void setup(){
  // Initilaize the sketch
  size(600,400);
  frameRate(24);

  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);

  // Choice of colors
  background(255);
  noFill();
  stroke(0);
  
  // Enable smoothing
  smooth();
  s = new RShape();
  s.addLineTo(30,100);
  s.addLineTo(100,160);
  s.addClose();
  s.draw();
  print(s.getArea());
  RG.saveShape("test.svg", s);
}
