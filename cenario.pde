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
