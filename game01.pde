//First version of the game01
boolean playing = false;
boolean playingTambor = false;
Maxim maxi;
AudioPlayer player;

void setup() {
  size(1024, 768); 
  background(0,255,0);
  
  //define and create the objects
  cenario = new Imagem("bgCenario.png", -10, 0);
  nuvens  = new Imagem("nuvens.png", -1024, 0);
  arvore  = new Imagem("arvore.png", -10, 0); 
  indio   = new Imagem("indio/indio", ".png", 2, 350, 350);
  
  //TODO: criar a classe Som para isolar a lógica;
  maxi = new Maxim(this);
  floresta = maxi.loadFile("FLORESTA_bg.mp3");
  somArvore = maxi.loadFile("ARVORE.mp3");
  tambor = maxi.loadFile("TAMBOR_INDIO.mp3");
  
}

void draw(){
  cenario.display();
  nuvens.display();
  arvore.display();
  nuvens.animateLoopX(1024);
  indio.animateFrame(playingTambor);
  floresta.play();
}
/*
void mousePressed(){
  playing = !playing;

  som.playSound(playing); 
}*/

void mouseReleased(){
  //Dispara som do tambor
  if ( mouseX>500 && mouseX<575 && mouseY>400 && mouseY<610) {
    if(!playing){
      tambor.cue(0);
      tambor.setLooping(true); 
      tambor.play();
      playingTambor = !playingTambor;
    }
    else{
      tambor.stop();
      playingTambor = !playingTambor;
    }
    
  }
  
  //Dispara som da arvore
  if ( mouseX>290 && mouseX<460 && mouseY>120 && mouseY<520) {
    if(!playing){
      somArvore.cue(0); 
      somArvore.play();
    }
    else{
      somArvore.stop();
    }
  }
  
  
  playing = !playing;
}
