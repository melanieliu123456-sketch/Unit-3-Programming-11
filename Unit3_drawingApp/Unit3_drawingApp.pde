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
float sliderY;

color strokecolor = #000000;

color selectedColor;

PImage stamp;

void setup() {
  size(600, 600);
  background(255);
  selectedColor = black; 
  sliderY = 350;
  stamp = loadImage("stamp.png");
}

void draw() {
  drawColors();
  drawslider();
  image(stamp, 30, 15, 50, 50);
  //guidelines();
}

void drawslider() {
  strokeWeight(5);
  fill(white);
  line(50, 150, 50, 550);
  circle(50, sliderY, 20);
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
  
  tactile(200, 15, 50);
  fill(orange);
  square(200, 15, 50);
  
  tactile(255, 15, 50);
  fill(yellow);
  square(255, 15, 50);
  
  tactile(310, 15, 50);
  fill(green);
  square(310, 15, 50);
  
  tactile(365, 15, 50);
  fill(blue);
  square(365, 15, 50);
  
  tactile(420, 15, 50);
  fill(purple);
  square(420, 15, 50);
  
  tactile(475, 15, 50);
  fill(black);
  square(475, 15, 50);
  
  tactile(530, 15, 50);
  fill(white);
  square(530, 15, 50);
}

void tactile (int x, int y, int s) {
  if (mouseX > x && mouseX < x + s &&
      mouseY > y && mouseY < y + s) {
    strokeWeight(2);
    stroke(#FFFFFF);
  } else {
    strokeWeight(2);
    stroke(strokecolor);
  }
}

void mouseDragged() {
  controlSlider();
  stroke(#000000);
  strokeWeight(map(sliderY, 150, 550, 10, 1));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mouseReleased() {
  if (mouseY < 80) {//choosing color
  }
}
/*
void guidelines() {
  strokeWeight(1);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  fill(#FFFFFF);
  text("(" + mouseX + ", " + mouseY + ")", mouseX+20, mouseY+20);
}
*/
