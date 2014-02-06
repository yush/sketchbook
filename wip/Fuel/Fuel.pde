/* @pjs crisp="true"; pauseOnBlur="true"; */

import de.bezier.guido.*;

final int NB_POINTS = 180;
int R;
int levelBefore, levelAfter;
final float R_MAX = 100;
SuSlider slLevelBefore;
SuSlider slLevelAfter;
SuSlider slRayon;
SuSlider slLg;
SuText stSurface;
SuText stNiveau;
SuText stLg;
float[] tabCos = new float[NB_POINTS];
float[] tabSin = new float[NB_POINTS];
SegCirc s1, s2;

void setup ()
{
  Interactive.make(this);  
  size(500, 500, OPENGL);
  frameRate(15);
  initGui();
  stroke(200);
  s1 = new SegCirc();
  s1.c = color(0,200,0);
  s2 = new SegCirc();
  s2.c = color(0,0,200);
}

void initGui() {     
  slLevelBefore = new SuSlider(2, 2, width/2, 16);
  slLevelBefore.setCaption("niveau initial");
  slLevelBefore.setRange(0, 180);
  slLevelBefore.value = 0;        

  slLevelAfter = new SuSlider(2, 20, width/2, 16);
  slLevelAfter.setCaption("niveau final");
  slLevelAfter.setRange(0, 180);
  slLevelAfter.value = 0;     

  slRayon = new SuSlider(2, 40, width/2, 16).setCaption("rayon")
                                              .setRange(50, R_MAX);                                      
  slLg = new SuSlider(2, 60, width/2, 16).setCaption("longeur")
                                              .setRange(200, R_MAX);                                      

  stSurface = new SuText(2, 80);
  stSurface.setCaption("surface");
  slRayon.value = 100;
  stNiveau = new SuText(2, 80);
  stNiveau.setCaption("hauteur");
  stSurface = new SuText(2, 100);
  stSurface.setCaption("surface");
  stLg = new SuText(2, 60);
  stLg.setCaption("longueur");
}

void draw ()
{
  pushMatrix();    
  translate(width/2, height/2);
  rotate(PI);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  background(100);   
  levelBefore = round(slLevelBefore.value);
  levelAfter = round(slLevelAfter.value);
  R = round(slRayon.value);
  stNiveau.value = calculeNiveau(R, levelBefore);
  stSurface.value = calculeAireDisqueOuvert(R, levelBefore);
  s1.processShape(R, 0, levelBefore);
  s2.processShape(R, levelBefore, levelAfter);
  s1.draw3d();
  s2.draw3d();
  popMatrix();
}

float calculeNiveau(float radius, int degre) {
  float h;
  h = map(tabSin[degre], -1, 1, 0, radius*2);
  return round(h);
}

float calculeAireSegmentCirculaire(float radius, int degre) {
  float A, theta;
  theta = map((180-degre)*2, 0, 360, 0, 2*PI); 
  A = ((radius*radius)/2)*(theta- sin(theta));  
  return A;
}

float calculeAireDisqueOuvert(float radius, int degre) {
  float S, C;
  S = calculeAireSegmentCirculaire(radius, degre);
  C = PI*radius*radius;
  return C-S; 
}
