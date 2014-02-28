 class Imagem{
  //attributes
  PImage imagem;
  int positionX, positionY, initialPosition;

  //constructor
  Imagem(String arquivo, int x, int y){
    imagem    = loadImage(arquivo);
    positionX = x;
    positionY = y;
    initialPosition = positionX;
  }

  //methods
  void display(){
    image(imagem, positionX, positionY);
  }

  void animateLoopX(int deslocX){
    if(positionX > deslocX){
      positionX = initialPosition;
    }
    positionX++;
  }
  
  //#TODO: implement this methods
  /*void animatePositionX(int deslocX){
    while(positionX < deslocX){
      positionX++;
    }
  }*/ 
}
