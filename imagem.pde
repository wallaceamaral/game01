 class Imagem{
  //attributes
  PImage imagem;
  int positionX, positionY;

  //constructor
  Imagem(String arquivo, int x, int y){
    imagem    = loadImage(arquivo);
    positionX = x;
    positionY = y;
  }

  //methods
  void display(){
    image(imagem, positionX, positionY);
  }

  void animateLoopX(int deslocX){
    if(positionX > deslocX){
      positionX = -deslocX;
    }
    positionX++;
  }
  
}
