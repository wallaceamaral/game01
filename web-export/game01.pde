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
  onda    = new Imagem("onda/ONDA", ".png", 4, 0, 0);
  agua    = new Imagem("agua/agua", ".png", 7, 0, 0);
  sol     = new Imagem("sol/sol", ".png", 5, 0, 0);
  
  //define and create the audio objects
  maxi = new Maxim(this);
  somFloresta = maxi.loadFile("FLORESTA_bg.mp3");
  somArvore = maxi.loadFile("ARVORE.mp3");
  somTambor = maxi.loadFile("TAMBOR_INDIO.mp3");
  
}

void draw(){
  cenario.display();
  sol.animateFrame(true, 70);
  nuvens.display();
  arvore.display();
  oca.display();

  
  nuvens.animateLoopX(1024);
  indio.animateFrame(playingTambor, 10);
  onda.animateFrame(true, 40);
  agua.animateFrame(true, 40);

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
 class Imagem{
  //attributes
  PImage imagem;
  PImage [] imagens;
  int positionX, positionY, initialPosition;
  int currentPosition = 0;
  int contVelocidade = 0;

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
  void animateFrame(boolean playing, int velocidade){
    this.display(imagens);

    if(playing){
      contVelocidade++;
      
      
      if(contVelocidade % velocidade == 0){
        currentPosition += 1;
 
        if(currentPosition >= imagens.length){
          currentPosition = 0;
        } 
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

