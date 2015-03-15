public class Corolle {
  public Corolle() {

  }

  void draw() {
    drawCylinder();
  }

  void drawCylinder() {
   final int NUM_VERT=6;
   final int r1 = 20;
   final int r2 = 55;
   final int h = 50;
   PVector p1,p2;
   beginShape(QUAD_STRIP);
   for (int i=0; i <= NUM_VERT; i++) {
     float angle = 2*PI/NUM_VERT;
     p1 = new PVector(sin(angle*i), 0, cos(angle*i));
     p1.mult(r1);
     p2 = new PVector(sin(angle*i), 0, cos(angle*i));
     p2.mult(r2);
     vertex(p1.x, 0, p1.z);
     vertex(p2.x, h, p2.z);
   }  
   endShape(); 
  }

  class Petale {
    Petale() {
    }
  }   

}
