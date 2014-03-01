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
  indio   = new Imagem("indio/indio", ".gif", 8, 500, 400);
  
  //TODO: criar a classe Som para isolar a lógica;
  maxi = new Maxim(this);
  floresta = maxi.loadFile("FLORESTA_bg.wav");
  somArvore = maxi.loadFile("ARVORE.wav");
  tambor = maxi.loadFile("TAMBOR_INDIO.wav");
  
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
//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
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

