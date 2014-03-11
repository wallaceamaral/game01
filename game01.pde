//First version of the game01

boolean playingArvore = false;
boolean playingTambor = false;
Maxim maxi;
AudioPlayer player;

void setup() {
  size(1024, 768); 
  background(0,255,0);
  
  //define and create the image objects
  cenario = new Imagem("bgCenario.png", -10, 0);
  nuvens  = new Imagem("nuvens.png", -1024, 0);
  arvore  = new Imagem("arvore.png", -10, 0); 
  indio   = new Imagem("indio/indio", ".png", 2, 0, 0);
  oca     = new Imagem("oca.png", 0, 0);
  
  //define and create the audio objects
  maxi = new Maxim(this);
  somFloresta = maxi.loadFile("FLORESTA_bg.mp3");
  somArvore = maxi.loadFile("ARVORE.mp3");
  somTambor = maxi.loadFile("TAMBOR_INDIO.mp3");
  
}

void draw(){
  cenario.display();
  nuvens.display();
  arvore.display();
  oca.display();

  nuvens.animateLoopX(1024);
  indio.animateFrame(playingTambor, 10);

  somFloresta.play();
  somFloresta.setLooping(true);
}


void mouseReleased(){
  //playing tambor
  if ( mouseX > 500 && mouseX < 575 && mouseY > 400 && mouseY < 610) {
    if(!playingTambor){
      somTambor.cue(0);
      somTambor.setLooping(true); 
      somTambor.play();
      playingTambor = !playingTambor;
    }
    else{
      somTambor.stop();
      playingTambor = !playingTambor;
    }
  }

  //playing arvore
  if ( mouseX > 290 && mouseX < 460 && mouseY > 120 && mouseY < 520) {
    if(!playingArvore){
      somArvore.cue(0); 
      somArvore.play();
      playingArvore = !playingArvore;
    }
    else{
      somArvore.stop();
      playingArvore = !playingArvore;
    }
  }
  
}
