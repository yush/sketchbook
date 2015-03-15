/* @pjs crisp=true; 
globalKeyEvents=true; 
 */

final int NUM_NODES = 10;
final int RADIUS = 30;
final int GRID_SIZE = 74;
Node aNode;
NodeList nl;
PFont f;
boolean showGrid = false;
boolean showDot= false;
PVector grid[][] = new PVector[GRID_SIZE][GRID_SIZE];

void setup() {
  frameRate(25);
  size(800,600);
  f = createFont("Umpush", 10);
  textFont(f); 
  nl = new NodeList(new PVector(0,0), new PVector(0, height));
  nl.prepareGrid();
  initNode();
}

void draw() {
  background(255);
  // affichage des cercles en arriere plan
  if (showGrid) {
    nl.showGrid();
  }
  if (showDot) {
    nl.showGridDot();
  }

  for (int i = 0; i < nl.size(); i++) {
    aNode = nl.get(i);  
    aNode.draw();
  }
}

void keyPressed() {
  if (key == 'g') {
    showGrid = !showGrid;
  } else if (key == 'd') {
    showDot = !showDot;
  }
}

void mouseDragged() {
  Node n;
  nl.deselectAll();
  n = nl.getNode(mouseX, mouseY);
  if(n != null) {
    n.isSelected = true;
    PVector v = getNearestCoord(nl.orig1, nl.orig2, mouseX, mouseY);
    n.x = v.x;
    n.y = v.y;
  }
}

void mousePressed() {
  Node n = null;
  println(nl);
  nl.deselectAll();  
  n = nl.getNode(mouseX, mouseY);
  if(n != null) {
    n.isSelected = true;
  }
}

// dessine des cercles concentriques à partir de x,y
void drawCircle(float x, float y) {
  float rad;
  for (int i = 0; i < width / RADIUS*4; i++) {
    rad = i*RADIUS;
    ellipse(x, y, rad, rad);
  }
}

void initNode() {
  PVector coord, f;
  for(int i = 0; i < NUM_NODES; i++) {
    aNode = new Node(nl);
    coord = new PVector();
    coord.x = random(width);
    coord.y = random(height);
    f = getNearestCoord(nl.orig1, nl.orig2, coord.x, coord.y);
    aNode.x = f.x;
    aNode.y = f.y;    
  }
}

// TODO: prend la coordonnee le plus proche de la position de la souris => intersection des cercles
// Trouver x, y tel que la distance entre le point et son origine soit un entier avec x et y le plus proche de px, py
PVector getNearestCoord(PVector orig1, PVector orig2, float px, float py) {
  PVector v;
  int r1, r2;
  v = new PVector(px, py);    
  r1 = (round(PVector.dist(v, orig1)/RADIUS))*RADIUS;
  r2 = (round(PVector.dist(v, orig2)/RADIUS))*RADIUS;;
  v = getCartesianCoordFor(orig1, orig2, new PVector(r1, r2));
  return v;
}

PVector getCartesianCoordFor(PVector orig1, PVector orig2, PVector aCir) {
  float r0, r1;
  float a1,a0;
  float b;
  float d = dist(orig1.x,orig1.y,orig2.x,orig2.y);
  // on calcule le rayon
  r0 = aCir.x;
  r1 = aCir.y;
  // determine la longueur du coté a
  a1 = ((r1*r1)+(d*d)-(r0*r0))/(2*d);
  a0 = ((r0*r0)+(d*d)-(r1*r1))/(2*d);
  // determine la longueur du coté b 
  b = sqrt((r1*r1)-(a1*a1));
  //b = sqrt((r1*r1)+(a1*a1));  
  PVector coord = new PVector(0, a0);
  coord.add(new PVector(b, 0));
  return coord;
}

public class Node {
  NodeList owner;
  float x;
  float y;
  boolean isSelected;
  public Node() {
    x = random(width);
    y = random(height);      
  }

  public Node(NodeList aOwner) {
    this();
    if (aOwner != null) {
      aOwner.add(this);
      this.owner = aOwner;
    }
  }

  boolean isAtCoord(float x, float y) {
    float d = dist(this.x, this.y, x, y);
    if ( d <= RADIUS) {
      return true;
    } else {
      return false;
    }
  }

  void draw() {
    float rad = 20;
    if (isSelected) 
    {
      stroke(100);
      pushStyle();
      fill(0);
      showSketchLines();
      popStyle();
    } else 
    {
      pushStyle();
      fill(0);
      // showSketchLines();
      popStyle();
      stroke(0);
    }
    ellipse(this.x, this.y, rad, rad);
  }

  void show() {
    println("x="+this.x+" y="+this.y);
  }

   void showSketchLines() {
     line(this.owner.orig1.x, this.owner.orig1.y, x, y); 
     PVector vec = new PVector(x,y);
     vec.add(this.owner.orig1);
     String lg = ""+round(PVector.dist(new PVector(x, y), this.owner.orig1)/RADIUS);
     vec.div(2);
     text(lg, int(vec.x), int(vec.y));

     line(this.owner.orig2.x, this.owner.orig2.y, x, y); 
     vec = new PVector(x,y);
     vec.add(this.owner.orig2);
     lg = ""+round(PVector.dist(new PVector(x, y), this.owner.orig2)/RADIUS);
     vec.div(2); //<>//
     text(lg, int(vec.x), int(vec.y));
 
     String out;
     out = "x="+this.x+"\n";
     out += "y="+this.y+"\n";
     text(out, this.x+RADIUS, this.y);
  }
}

public class NodeList extends ArrayList<Node>{
  PVector orig1;
  PVector orig2;  

  NodeList(PVector o1, PVector o2) {
    orig1 = o1;
    orig2 = o2;
  }

  Node getNode(float x, float y) {
    Node n;
    for(int i = 0; i < this.size(); i ++) {
      n = this.get(i);
      if (n.isAtCoord(x, y)) {
       return n; 
      }
    }
    return null;
  }

  void deselectAll() {

    for(int idx = 0; idx < this.size(); idx++) {
      Node n = this.get(idx);
      n.isSelected = false;
    }

  }

  // dessine les cercles reperes
  void showGrid() {
    noFill();
    for (int i=0; i < GRID_SIZE; i++) {
      ellipse(orig1.x, orig1.y, i*RADIUS*2, i*RADIUS*2);
      ellipse(orig2.x, orig2.y, i*RADIUS*2, i*RADIUS*2);
    }
  }

  // place un point a l'intersction de chaque cercle
  void showGridDot() {
    PVector p;
    noFill();
    stroke(255,0,0);
    for (int i=0; i < GRID_SIZE; i++) {
      for (int j=0; j < GRID_SIZE; j++) {
        p = grid[i][j];
        ellipse(p.x, p.y, 5, 5);
      }
    }
  } //<>//

  // precalcul les intersections de chaque cercle
  void prepareGrid() {
    for (int i=0; i <  GRID_SIZE; i++) {
      for (int j=0; j < GRID_SIZE; j++) {
        grid[i][j] = getCartesianCoordFor(orig1, orig2, new PVector(i*RADIUS, j*RADIUS)); 
      }
    }
  }
  
}
