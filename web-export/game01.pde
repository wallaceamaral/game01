//First version of the game01
boolean playing = false;

void setup() {
  size(1024, 768); 
  background(0,255,0);
  
  //define and create the objects
  cenario = new Cenario();
  nuvens  = new Nuvens();
  arvore  = new Arvores(); 
}

void draw(){
  cenario.display();
  nuvens.display();
  arvore.display();
}

void mousePressed(){
  playing = !playing;

  cenario.playSound(playing);
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
     player = maxi.loadFile("mykbeat.wav");
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

