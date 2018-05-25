//Shaeel, Hamza, Talha
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

//<SOUND>
Dial dial;
Gain gain;
VolumeControl volControl;
AudioPlayer [] player;
AudioMetaData [] meta;
int numSongs = 1;

//<BUTTONS>
PVector song1;
PVector song1Size;
PVector durationDisplay;
PVector durationDisplaySize;
PVector waitDisplay;
PVector waitDisplaySize;

//<TIMER>
int input;
boolean duration = false;
boolean wait = false;
long timer;
long delay;
long ms;
int [] msg;
PVector[] msgPos;


void setup()
{
  size(1400, 800);
  rectMode(CENTER);
  textAlign(CENTER);

  init();
}

void init()
{
  minim = new Minim(this);
  player = new AudioPlayer[numSongs];
  meta = new AudioMetaData[numSongs];
  dial = new Dial(0, 10, 10, true);
  dial.setTitle("Volume");
  volControl = new VolumeControl(player, dial);

  for (int i = 0; i < player.length; i++)
  {
    player[i] = minim.loadFile(i+".mp3");
    meta[i] = player[i].getMetaData();
  }

  mouse = new PVector();
  song1 = new PVector(width/2, height/2);
  song1Size = new PVector (50, 50);
  durationDisplay = new PVector(width*0.25, height*0.55);
  durationDisplaySize = new PVector (150, 30);
  waitDisplay = new PVector(width*0.25, height/2);
  waitDisplaySize = new PVector (150, 30);
}

void Buttons()
{
  stroke(0);
  fill(255);
  rect(song1.x, song1.y, song1Size.x, song1Size.y);

  stroke(0);
  fill(255);
  rect(waitDisplay.x, waitDisplay.y, waitDisplaySize.x, waitDisplaySize.y);
  
  stroke(0);
  fill(255);
  rect(durationDisplay.x, durationDisplay.y, durationDisplaySize.x, durationDisplaySize.y);
}

void Timer()
{
  println(input);
  textSize(20);
  fill(0);
  text(timer/1000 + " s", durationDisplay.x, durationDisplay.y);
  text(delay/1000 + " s", waitDisplay.x, waitDisplay.y);
}


void mouseClicked()
{
  if (abs(mouse.x - song1.x) < song1Size.x/2 && abs(mouse.y - song1.y) < song1Size.y/2)
  {
    println("...");
    player[0].play();
  }
}

void keyPressed() {
  if (duration == true) {
    if (key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' ||key == '0') {
      input = abs(input*10);
      input = abs(input+key-48);
      timer = abs(input*1000);
    }
  }
  if (wait == true) {
    if (key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' ||key == '0') {
      input = abs(input*10);
      input = abs(input+key-48);
      delay = abs(input*1000);
    }
  }
  if (key == ENTER) {
    duration = false;
    wait = false; 
    input = 0;
  }
  if (key == 'd') {
    wait = false;
    duration = true;
    input = 0;
  }
  if (key == 't') {
    duration = false;
    wait = true;
    input = 0;
  }
}

void draw()
{
  background(255);
  mouse = new PVector(mouseX, mouseY);
  Buttons();
  Timer();
  dial.update(mouse);
  volControl.update();
}
