//////////////////////////////////////
//SavingSVG///////////////////////////
//////////////////////////////////////
//StudioObjetAugmenté de l'EnsAD//////
//http://soa.ensad.fr/?p=1193/////////
//////////////////////////////////////

//Importe la librairie 
import org.philhosoft.p8g.svg.P8gGraphicsSVG;

//Définit un objet SVG
P8gGraphicsSVG svg;

void setup()
{
  size(600, 600);
  background(255);
  smooth();
//Définit le fichier SVG qui sera sauvé   
  svg = (P8gGraphicsSVG) createGraphics(width, height, P8gGraphicsSVG.SVG, "motifG.svg");
  beginRecord(svg); 
//Écrit dans le moniteur les touches à utiliser pour sauver et quitter le sketch
  println("Utiliser la touche S pour sauver l'image et la touche Q pour quitter le sketch");
}

void draw()
{
 //Définit la couleur et la taille des lignes 
 stroke(0);
 strokeWeight(0.2);
 //Si je presse la bouton de la souris alors je commence à dessiner
 if (mousePressed == true){
 //Dessine des lignes qui comme point d'origine la souris et comme fin un point alétoire dans le sketch  
 if (pmouseX != 0 && pmouseY !=0)line(mouseX,mouseY, random(0,600),random(0,600));
}
}

//Fonction pour utiliser les touches 
void keyPressed()
{
  //Si j'appuie sur la touche 's' je sauve mon image en SVG
  if (key == 's') 
  {
    svg.endRecord();
    println("Saved.");
  }
  //Si j'appuie sur la touche 'q' je quitte le sketch
  else if (key == 'q') 
  {
    svg.clear();
    exit();
  }
}

