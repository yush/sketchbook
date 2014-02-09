public class Snez {
  PVector p1, p2, p3, p4, pCenter, dir;
  Snez(PVector v1, PVector v2, PVector v3, PVector v4) {
    p1 = v1.get();
    p2 = v2.get();
    p3 = v3.get();
    p4 = v4.get();    
    pCenter = p1.get();
    pCenter.add(p2);
    pCenter.add(p3);
    pCenter.add(p4);
    pCenter.div(4);
    dir = new PVector(randomGaussian(), randomGaussian());
    dir.mult(W/16);
  } 
  
  void draw() {
    beginShape(QUAD);
    vertex(p1.x, p1.y);
    vertex(p2.x, p2.y);
    vertex(p3.x, p3.y);
    vertex(p4.x, p4.y);    
    endShape();
    pushMatrix();
    for (int i = 0; i < 5; i++) {
      this.insideDraw(i);
    }
    popMatrix();
  }

  void insideDraw(int num) {
    PVector off = new PVector(3, 3);
    p1.add(off.x, off.y, 0);
    p2.add(-off.x, off.y, 0);
    p3.add(-off.x, -off.y, 0);
    p4.add(off.x, -off.y, 0);
    dir.div(1.5);
    translate(dir.x, dir.y, dir.z);
    beginShape(QUAD);
    vertex(p1.x, p1.y);
    vertex(p2.x, p2.y);
    vertex(p3.x, p3.y);
    vertex(p4.x, p4.y);    
    endShape();
  } 
}
