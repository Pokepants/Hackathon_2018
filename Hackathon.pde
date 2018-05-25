//Shaeel, Humza, Talha
//Hackathon

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

//<GLOBAL VARIABLES>
PVector mouse;
AudioPlayer [] player;
int numSongs = 2;

//<BUTTONS>
PVector button;
PVector buttonSize;


void setup()
{
  size(1400, 800);
  rectMode(CENTER);
  
  init();
}

void init()
{
  minim = new Minim(this);
  player = new AudioPlayer[1];

  for (int i = 0; i < player.length; i++)
  {
    player[i] = minim.loadFile(i+".mp3");
  }

  mouse = new PVector();
  button = new PVector(width/2, height/2);
  buttonSize = new PVector (50, 50);
}

void Buttons()
{
  fill(0);
  rect(button.x,button.y,buttonSize.x,buttonSize.y);
}

void mouseClicked()
{
  if (abs(mouse.x - button.x) < buttonSize.x/2 && abs(mouse.y - button.y) < buttonSize.y/2)
  {
    println("...");
    player[0].play();
  }
}

void draw()
{
  background(255);
  mouse = new PVector(mouseX, mouseY);
  Buttons();
}
