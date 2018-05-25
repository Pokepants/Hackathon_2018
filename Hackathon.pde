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
PImage background;

//<SOUND>
Dial dial;
Gain gain;
VolumeControl volControl;
AudioPlayer [] player;
AudioMetaData [] meta;
int numSongs = 6;

//<BUTTONS>
PVector song1;
PVector song1Size;
PVector song2;
PVector song2Size;
PVector song3;
PVector song3Size;
PVector song4;
PVector song4Size;
PVector song5;
PVector song5Size;
PVector durationDisplay;
PVector durationDisplaySize;
PVector waitDisplay;
PVector waitDisplaySize;
PVector playB;
PVector playBSize;
PVector mainDisplay;
PVector mainSizeDisplay;
int song_1 = -1;
int song_2 = -1;
int song_3 = -1;
int song_4 = -1;
int song_5 = -1;

//<TIMER>
int input;
boolean duration = false;
boolean wait = false;
long timer;
long delay;
long ms;
int [] msg;
PVector[] msgPos;
public static long startTime;
public static long timeDuration;


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

  background = loadImage("BackGround.jpg");
  mouse = new PVector();
  song1 = new PVector(width*0.38, height*0.75);
  song1Size = new PVector (167, 30);
  song2 = new PVector (width*0.5, height*0.75);
  song2Size = new PVector (167, 30);
  song3 = new PVector(width*0.62, height*0.75);
  song3Size = new PVector (167, 30);
  song4 = new PVector(width*0.44, height*0.85);
  song4Size = new PVector (167, 30);
  song5 = new PVector (width*0.57, height*0.85);
  song5Size = new PVector (167, 30);
  durationDisplay = new PVector(width*0.25, height*0.55);
  durationDisplaySize = new PVector (150, 60);
  waitDisplay = new PVector(width*0.25, height*0.47);
  waitDisplaySize = new PVector (150, 60);
  playB = new PVector (width*0.25, height*0.675);
  playBSize = new PVector (125, 100);
  mainDisplay = new PVector (width/2,height/2);
  mainSizeDisplay = new PVector (400,300);
}

void Buttons()
{
  strokeWeight(1);
  textSize(20);
  
  stroke(0);
  fill(255,0,0);
  rect(song1.x, song1.y, song1Size.x, song1Size.y);
  fill(0);
  text(meta[0].title(),song1.x,song1.y);
  
  stroke(0);
  fill(245,171,96);
  rect(song2.x, song2.y, song2Size.x, song2Size.y);
  fill(0);
  text(meta[1].title(),song2.x,song2.y);
  
  stroke(0);
  fill(245,239,57);
  rect(song3.x, song3.y, song3Size.x, song3Size.y);
  fill(0);
  text(meta[2].title(),song3.x,song3.y);

  stroke(0);
  fill(158,240,136);
  rect(song4.x, song4.y, song4Size.x, song4Size.y);
  fill(0);
  text(meta[3].title(),song4.x,song4.y);
  
  stroke(0);
  fill(136,152,240);
  rect(song5.x, song5.y, song2Size.x, song2Size.y);
  fill(0);
  text(meta[4].title(),song5.x,song5.y);
  
  stroke(0);
  fill(255);
  rect(waitDisplay.x, waitDisplay.y, waitDisplaySize.x, waitDisplaySize.y);
  fill(0);
  text("Delay",waitDisplay.x,waitDisplay.y - 20);

  stroke(0);
  fill(198,198,198);
  rect(durationDisplay.x, durationDisplay.y, durationDisplaySize.x, durationDisplaySize.y);
  fill(0);
  text("Play After",durationDisplay.x,durationDisplay.y - 20);

  stroke(0);
  fill(96,203,211);
  rect(playB.x, playB.y, playBSize.x, playBSize.y);
  fill(0);
  text("PLAY",playB.x, playB.y);

  stroke(0);
  fill(198,198,198);
  rect(mainDisplay.x, mainDisplay.y, mainSizeDisplay.x, mainSizeDisplay.y);
}

void Timer()
{
  textSize(20);
  fill(0);
  text(timer/1000 + " s", durationDisplay.x, durationDisplay.y + 10);
  text(delay/1000 + " s", waitDisplay.x, waitDisplay.y + 10);
}

void startTimer() {
    startTime = System.currentTimeMillis();
  }

void getTimeElapsed() {
    timeDuration = System.currentTimeMillis() - startTime;
  }


void mouseClicked()
{
  if (abs(mouse.x - song1.x) < song1Size.x/2 && abs(mouse.y - song1.y) < song1Size.y/2)
  {
    println("...");
    song_1 = 0;
  }
  
  if (abs(mouse.x - song2.x) < song2Size.x/2 && abs(mouse.y - song2.y) < song2Size.y/2)
  {
    println("...");
    song_2 = 1;
  }
  
  if (abs(mouse.x - song3.x) < song3Size.x/2 && abs(mouse.y - song3.y) < song3Size.y/2)
  {
    println("...");
    song_3 = 2;
  }
  
  if (abs(mouse.x - song4.x) < song4Size.x/2 && abs(mouse.y - song4.y) < song4Size.y/2)
  {
    println("...");
    song_4 = 3;
  }
  
  if (abs(mouse.x - song5.x) < song5Size.x/2 && abs(mouse.y - song5.y) < song5Size.y/2)
  {
    println("...");
    song_5 = 4;
  }
  
  if (abs(mouse.x - playB.x) < playBSize.x/2 && abs(mouse.y - playB.y) < playBSize.y/2)
  {
    if (song_1 >= 0) {
      print("song1");
      player[song_1].play();
    }
    }
    if (song_2 >= 0) {
      print("song2");
      player[song_2].play();
    }
    if (song_3 >= 0) {
      print("song3");
      player[song_3].play();
    }
    if (song_4 >= 0) {
      print("song4");
      player[song_4].play();
    }
    if (song_5 >= 0) {
      print("song5");
      player[song_5].play();
    }
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
  background(background);
  mouse = new PVector(mouseX, mouseY);
  Buttons();
  Timer();
  dial.update(mouse);
  volControl.update();
}
