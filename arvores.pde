class Arvores{
  PImage arvores;
  
  //constructor
  Arvores(){
    arvores = loadImage("arvore.png");
  }
  
  //draw this object
  void display(){
    image(arvores, -10, 0);
  }
}
