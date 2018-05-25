int textSize = 28;
int input;
boolean timed = false;
boolean dtimed = false;
long timer;
long delay;
long ms;
int [] msg;
PVector[] msgPos;
color msgColor = color (200, 0, 150);  

void setup() {
  size(600, 600);

  init();
}
void init() {
  textAlign(CENTER, CENTER);
  textSize(textSize);
  color(200);
}


void keyPressed() {
  if (timed == true) {
    if (key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' ||key == '0') {
      input = abs(input*10);
      input = abs(input+key-48);
      timer = abs(input*1000);
    }
  }
  if (dtimed == true) {
    if (key == '1' ||key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' ||key == '0') {
      input = abs(input*10);
      input = abs(input+key-48);
      delay = abs(input*1000);
    }
  }
  if (key == ENTER){
   timed = false;
   dtimed = false; 
   input = 0;
  }
  if (key == 'd') {
    timed = true;
  }
  if (key == 't') {
    dtimed = true;
  }
}



void draw() {
  background(1);
  println(input);
  text(timer/1000 + " s", 100, 100);
  text(delay/1000 + " s", 200, 200);
}
