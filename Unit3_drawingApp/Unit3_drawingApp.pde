//Melanie Liu
//block 2-2
//2026 Apr 13

color red = #F25F5F;
color orange = #EAB36B;
color yellow = #F2DE69;
color green = #8AE08D;
color blue = #86D6E5;
color purple = #C4A8ED;
color white = #FFFFFF;
color black = #000000;

color strokecolor = #000000;

color selectedColor;

PImage stamp;

void setup() {
  size(600, 600);
  background(255);
  selectedColor = black; 
  stamp = loadImage("stamp.png");
}

void draw() {
  background(255);
  drawColors();
  image(stamp, 15, 15, 50, 50);
  guidelines();
}

void drawColors() {
  //base
  noStroke();
  fill(#000000);
  rect(0, 0, 600, 80);
  //buttons
  tactile(145, 15, 50);
  fill(red);
  square(145, 15, 50);
}

void tactile (int x, int y, int s) {
  if (mouseX > (x-s) && mouseX < (x+s) && mouseY > (y-s) && mouseY < (y+s)) {
    stroke(#FFFFFF);
  } else {
    stroke(strokecolor);
  }
}

void guidelines() {
  strokeWeight(1);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  fill(#FFFFFF);
  text("(" + mouseX + ", " + mouseY + ")", mouseX+20, mouseY+20);
}
