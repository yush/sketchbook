
final int W = 50;
final int HAZ = 10;
final int X_GRID = 5;
final int Y_GRID = 5;
Snez aSnez;
PVector vTl, vTr, vBr, vBl;
Snez[][] grid = new Snez[X_GRID][Y_GRID];

void setup() {
  Snez n;
  PVector v1, v2;
  size(400,400, OPENGL);
  noFill();
  background(255);
  translate(10, 10, 0);
  vTl = PVector.random2D();  
  vTr = vTl.get();
  vTr.add(W, 0, 0);
  vBr = vTr.get();
  vBr.add(0, W, 0);
  vBl = vBr.get();
  vBl.add(-W, 0, 0);
  aSnez = new Snez(vTl, vTr, vBr, vBl); 

  for (int j=0; j < Y_GRID; j++) {
    
    if (j == 0) {
    } else {
      aSnez = grid[0][j-1];
      v1 = aSnez.p4.get();
      v1.add(0, W, 0);
      v2 = aSnez.p3.get();
      v2.add(0, W, 0);
      aSnez = new Snez(aSnez.p4, aSnez.p3, v2, v1); 
    }
    for (int i=0; i < X_GRID; i++) {
      if (i == 0) {
        n = aSnez;
      } else {
        v1 = aSnez.p2.get();
        v1.add(W, 0, 0);
        v2 = aSnez.p3.get();
        v2.add(W, 0, 0);
        n = new Snez(aSnez.p2, v1, v2, aSnez.p3); 
      }
      grid[i][j] = n;
      aSnez = n;
    }
  }

  for (int j=0; j < Y_GRID; j++) {
    for (int i =0; i < X_GRID; i++) {
      grid[i][j].draw();
    }
  }
}
