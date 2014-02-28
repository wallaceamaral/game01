//First version of the game01
boolean playing = false;

void setup() {
  size(1024, 768); 
  background(0,255,0);
  
  //define and create the objects
  cenario = new Imagem("bgCenario.png", -10, 0);
  nuvens  = new Imagem("nuvens.png", -1024, 0);
  arvore  = new Imagem("arvore.png", -10, 0); 
  indio   = new Imagem("indio/indio", ".gif", 8, 40, 0);
}

void draw(){
  cenario.display();
  nuvens.display();
  arvore.display();
  nuvens.animateLoopX(1024);
  indio.animateFrame(playing);
}

void mousePressed(){
  playing = !playing;

  //cenario.playSound(playing);
}
