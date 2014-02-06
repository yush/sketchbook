public class SegCirc {
  color c;
  float radius;
  int initH, degre;
  ArrayList<PVector> p;
  float[] tabCos = new float[NB_POINTS];
  float[] tabSin = new float[NB_POINTS];
  
  SegCirc() {
    radius = -1;
    initH = -1;
    degre = -1;
    p = new ArrayList<PVector>(); 
    for (int i = 0; i < NB_POINTS; i++) {
      tabCos[i] = cos(map(i, 0, NB_POINTS, -PI/2, PI/2));
      tabSin[i] = sin(map(i, 0, NB_POINTS, -PI/2, PI/2)); 
    }    
  }
  
  void processShape(float tRadius, int tInitH, int tDegre) {
    PVector v;
    int i;
    if(radius != tRadius || initH != tInitH || degre != tDegre) {
      radius = tRadius;
      initH = tInitH;
      degre = tDegre;
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
  
  void draw3d() {
    PVector v1;
    int l = 100;
    fill(c);
    translate(0, 0, l/2);
    this.draw();
    translate(0, 0, -l);
    this.draw();
    translate(0, 0, l/2);
    beginShape(QUAD_STRIP);
    for (int i = 0; i < p.size(); i++) {
      v1 = p.get(i);
      vertex(v1.x,v1.y, l/2);
      vertex(v1.x,v1.y, -l/2);
    }
    endShape(); 
  }
}
