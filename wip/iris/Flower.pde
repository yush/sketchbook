public class Flower {
  Corolle cor;
  Tige tige;

  Flower() {
    cor = new Corolle();  
    tige = new Tige();
  }

  void draw() {
    pushMatrix();
    tige.draw(); 
    cor.draw();
    popMatrix();
  }

  class Tige {
    ArrayList<PVector> points;
    PVector p;

    Tige() {
      points = new ArrayList();
      for( int i=0; i < 10; i++) {
        p = new PVector(random(-10,10), random(20), random(-3,3));
        points.add(p.get());
      } 
    }

    void draw() {
      stroke(0);
      for(int i=0; i < points.size(); i++) {
        p = points.get(i);
        line(0,0,0,p.x,p.y,p.z);
        translate(p.x,p.y,p.z); 
      }
    }
  }

}
