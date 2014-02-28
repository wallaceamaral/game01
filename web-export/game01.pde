//First version of the game01
boolean playing = false;

void setup() {
  size(1024, 768); 
  background(0,255,0);
  
  //define and create the objects
  cenario = new Imagem("bgCenario.png", -10, 0);
  nuvens  = new Imagem("nuvens.png", -1024, 0);
  arvore  = new Imagem("arvore.png", -10, 0); 
}

void draw(){
  cenario.display();
  nuvens.display();
  arvore.display();
  nuvens.animateLoopX(1024);
}

void mousePressed(){
  playing = !playing;

  //cenario.playSound(playing);
}
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
class Cenario{
  PImage bgCenario;
  Maxim maxi;
  AudioPlayer player;
  
  //constuctor
  Cenario(){
    bgCenario = loadImage("bgCenario.png");
   
     maxi = new Maxim(this);
     player = maxi.loadFile("FLORESTA_bg.wav");
  }
 
 //draw this object
  void display(){
    image(bgCenario, -10, 0);
  }
  
 //play the music
  void playSound(boolean playing){
    if(playing){
      player.cue(0);
      player.play();
    }else{
      player.stop();
    }
  }
}
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
/*class Nuvens{
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
    //posicNuvensX++; 
  }
}
}
*/

