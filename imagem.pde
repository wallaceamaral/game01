 class Imagem{
  //attributes
  PImage imagem;
  PImage [] imagens;
  int positionX, positionY, initialPosition;
  int currentPosition = 0;

  //constructor
  Imagem(String arquivo, int x, int y){
    imagem    = loadImage(arquivo);
    positionX = x;
    positionY = y;
    initialPosition = positionX;
  }

  Imagem(String caminho, String extensao, int quantidade, int x, int y){
    imagens = loadImages(caminho, extensao, quantidade);
    positionX = x;
    positionY = y;
  }

  //methods

  //displays
  void display(){
    image(imagem, positionX, positionY);
  }

  void display(PImage [] imagens){
    image(imagens[3], positionX, positionY);
  }

  void display(PImage [] imagens){
    image(imagens[currentPosition], positionX, positionY);
    console.log(imagens);
    console.log(positionX);
    console.log(positionY);
  }


  //basic animations
  void animateLoopX(int deslocX){
    if(positionX > deslocX){
      positionX = initialPosition;
    }

    positionX++;
  }


  //animations frame to frame
  void animateFrame(boolean playing){
    this.display(imagens);

    if(playing){
      currentPosition += 1;
 
      if(currentPosition >= imagens.length){
        currentPosition = 0;
      }
    }
  }

 /*
 #TODO: implement this methods
 void animatePositionX(int deslocX){
    while(positionX < deslocX){
      positionX++;
    }
  }*/ 
}
