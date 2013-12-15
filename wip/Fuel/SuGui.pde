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
