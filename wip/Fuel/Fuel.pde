/* @pjs crisp="true"; pauseOnBlur="true"; */

import de.bezier.guido.*;

final int NB_POINTS = 180;
int R;
int levelBefore, levelAfter;
final float R_MAX = 100;
final int L_MAX = 100;
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
  slLevelBefore.setRange(0, R_MAX);
  slLevelBefore.value = 0;        

  slLevelAfter = new SuSlider(2, 20, width/2, 16);
  slLevelAfter.setCaption("niveau final");
  slLevelAfter.setRange(0, R_MAX);
  slLevelAfter.value = 0;     

  slRayon = new SuSlider(2, 40, width/2, 16).setCaption("rayon")
                                              .setRange(50, R_MAX);                                      
  slLg = new SuSlider(2, 60, width/2, 16).setCaption("longeur")
                                              .setRange(100, 300);                                      
  slLg.value = 200;

  slRayon.value = 100;
  stNiveau = new SuText(2, 100);
  stNiveau.setCaption("hauteur");
  stSurface = new SuText(2, 120);
  stSurface.setCaption("surface");
  stLg = new SuText(2, 80);
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
  levelBefore = round(slLevelBefore.value/L_MAX*NB_POINTS);
  levelAfter = round(slLevelAfter.value/L_MAX*NB_POINTS);
  R = round(slRayon.value);
  s1.l = round(slLg.value);
  s2.l = round(slLg.value);
  stLg.value = s1.l;
  s1.processShape(R, 0, levelBefore);
  s2.processShape(R, levelBefore, levelAfter);
  stNiveau.value = round(s1.calculeNiveau());
  //stSurface.value = s1.calculeAireDisqueOuvert();
  s1.draw3d();
  s2.draw3d();
  popMatrix();
}


