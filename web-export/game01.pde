PImage bgCenario, arvore, nuvens;
int posicNuvensX = -768;
Maxim maxi;
AudioPlayer player;

void setup() {
  size(1024, 768); 
  background(0,255,0);
  
  bgCenario = loadImage("bgCenario.png");
  arvore = loadImage("arvore.png");
  nuvens = loadImage("nuvens.png");
 

 
  maxi = new Maxim(this);
  player = maxi.loadFile("mykbeat.wav");
}

void draw(){
  image(bgCenario, -10, 0);
  image(nuvens, posicNuvensX, 0);
  image(arvore, -10, 0);
  if(posicNuvensX>768){
    posicNuvensX=-768;
  }
  posicNuvensX++;
}

void mousePressed(){
  player.cue(0);
  player.play();
}

