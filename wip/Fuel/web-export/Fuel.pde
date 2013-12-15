/* @pjs crisp="true"; pauseOnBlur="true"; */

import de.bezier.guido.*;

final int NB_POINTS = 180;
int R;
int levelBefore, levelAfter;
final float R_MAX = 100;
SuSlider slLevelBefore;
SuSlider slLevelAfter;
SuSlider slRayon;
SuText stSurface;
SuText stNiveau;
float[] tabCos = new float[NB_POINTS];
float[] tabSin = new float[NB_POINTS];

void setup ()
{
  Interactive.make(this);  
    size(400, 400);
    
    for (int i = 0; i < NB_POINTS; i++) {
      tabCos[i] = cos(map(i, 0, NB_POINTS, -PI/2, PI/2));
      tabSin[i] = sin(map(i, 0, NB_POINTS, -PI/2, PI/2)); 
    }
    initGui();
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
  slRayon.value = 100;
  stNiveau = new SuText(2, 60);
  stNiveau.setCaption("hauteur");
  stSurface = new SuText(2, 80);
  stSurface.setCaption("surface");
}

void draw ()
{
  translate(width/2, height/2);
  rotate(PI);
  background( 0 );   
  stroke(255); 
  levelBefore = round(slLevelBefore.value);
  levelAfter = round(slLevelAfter.value);
  R = round(slRayon.value);
  stNiveau.value = calculeNiveau(R, levelBefore);
  stSurface.value = calculeAireDisqueOuvert(R, levelBefore);
  segmentCirculaire(R, levelBefore, color(0,0,255));
  segmentCirculaire(R, levelAfter, color(0,255,0));
  rotate(PI);  
  translate(-width/2, -height/2);
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

void segmentCirculaire(float radius, int degre, color c) {
  int i;
  fill(c);
  beginShape();
  for (i = 0; (i < NB_POINTS-1) && (i < degre); i++) {
    vertex(tabCos[i]*radius,tabSin[i]*radius);
  }
  vertex(0, tabSin[i]*radius);
  endShape();
  
  beginShape();
  for (i = 0; (i < NB_POINTS-1) && (i < degre); i++) {
    vertex(-tabCos[i]*radius,tabSin[i]*radius);
  }
  vertex(0, tabSin[i]*radius);
  endShape(); 
}
public class SuBase {
  float x, y;
  int height = 16;
  int width = 0;
  float value;
  String caption = "";
 
  SuBase(float xx, float yy) {
    x = xx;
    y = yy;
    value = 0;
    Interactive.add(this);
  } 
  
  SuBase setCaption(String c) {
    caption = c;
    return this;
  }     
  
  SuBase setValue(float v) {
    value = v;
    return this; 
  }
  
}

public class SuText extends SuBase {
  
  SuText(int xx, int yy) {
    super(xx, yy);   
  }
  
  void draw () 
  {
    stroke(255);
    text(caption+": "+value,x,y+height);        
  }  
}

public class SuSlider
{
    final float nullValue = -9999;
    float x, y, width, height;
    float valueX = 0, value;
    float rangeL, rangeH;
    String caption = "";
    
    SuSlider ( float xx, float yy, float ww, float hh ) 
    {
      x = xx; 
      y = yy; 
      width = ww; 
      height = hh;        
      valueX = x;  
      // register it
      Interactive.add(this);
    }
    
    SuSlider setRange(float l, float h) {
      rangeL = l;
      rangeH = h;
      return this;   
    }

    SuSlider setCaption(String c) {
      caption = c;
      return this;
    }    
    
    
    SuSlider setValue(float v) {
      value = v;
      return this; 
    }
    
    // called from manager
    void mouseDragged ( float mx, float my )
    {
      valueX = mx - height/2;
      
      if ( valueX < x ) valueX = x;
      if ( valueX > x+width-height ) valueX = x+width-height;
      
      value = map( valueX, x, x+width-height, rangeL, rangeH );
    }

    void draw () 
    {
      stroke(255);
      
      fill( 100 );
      rect(x, y, width, height);        
      fill(255);
      if (caption != "") {
        text(caption, x+width-textWidth(caption)-10, y+height-2);
      } 
      text(value,width+12,y+height-2);        
      fill( 120 );
      rect(valueX, y, height, height );
    }
}

