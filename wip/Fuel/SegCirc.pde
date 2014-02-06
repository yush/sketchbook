public class SegCirc {
  color c;
  ArrayList<PVector> p;
  float[] tabCos = new float[NB_POINTS];
  float[] tabSin = new float[NB_POINTS];
  
  SegCirc() {
    p = new ArrayList<PVector>(); 
    for (int i = 0; i < NB_POINTS; i++) {
      tabCos[i] = cos(map(i, 0, NB_POINTS, -PI/2, PI/2));
      tabSin[i] = sin(map(i, 0, NB_POINTS, -PI/2, PI/2)); 
    }    
  }
  
  void processShape(float radius, int initH, int degre) {
    PVector v;
    int i;
    p.clear();
    v = new PVector(0, tabSin[initH]*radius);
    p.add(v);
    for (i = initH; (i < NB_POINTS-1) && (i < degre); i++) {
      v = new PVector(tabCos[i]*radius,tabSin[i]*radius);
      p.add(v);
    }
    for (i = p.size()-1; i > 0; i--) {
      v = p.get(i);
      p.add(new PVector(-v.x, v.y));
    }
    
  }
  
  void draw() {
    PVector v;
    fill(c);
    beginShape();
    for (int i = 0; i < p.size(); i++) {
      v = p.get(i);
      vertex(v.x,v.y);
    }
    v = p.get(0);
    vertex(v.x,v.y);
    endShape();     
  }
}
