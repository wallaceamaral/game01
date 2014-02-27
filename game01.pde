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
