class Nuvens{
  PImage nuvens;
  int posicNuvensX = -768;
  
  //constructor
  Nuvens(){
    nuvens = loadImage("nuvens.png");
  }
  
  //draw this object
  void display(){
    image(nuvens, posicNuvensX, 0);
  
    if(posicNuvensX > 768){
      posicNuvensX = -768;
    }
    posicNuvensX++; 
  }
}
