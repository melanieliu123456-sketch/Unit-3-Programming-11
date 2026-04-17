//Melanie Liu
//block 2-2
//2026 Apr 13

int topBarH = 80;
int leftBarW = 80;
PImage stamp;
boolean stampOn;

color red = #F25F5F;
color orange = #EAB36B;
color yellow = #F2DE69;
color green = #8AE08D;
color blue = #86D6E5;
color purple = #C4A8ED;
color white = #FFFFFF;
color black = #000000;
float sliderY;
color strokecolor = black;
color selectedColor;

void setup() {
  size(600, 600);
  background(255);
  selectedColor = black; 
  stampOn = false;
  sliderY = 450;
  stamp = loadImage("stamp.png");
}
 
void draw() {
  noStroke();
  fill(0);
  rect(0, 0, width, topBarH);
  rect(0, topBarH, leftBarW, height-topBarH);

  drawColors();
  drawslider();
}

void drawslider() {
  stroke(255);
  strokeWeight(5);
  line(40, 170, 40, 570);

  fill(255);
  circle(40, sliderY, 20);
}

void drawColors() {
  //base
  noStroke();
  fill(#000000);
  rect(0, 0, 600, 80);
  
  //stamp
  fillstampback();
  tactile(15, 15, 50);
  square(15, 15, 50);
  image(stamp, 15, 15, 50, 50);
  
  //buttons
  tactile(170, 40, 25);
  fill(red);
  circle(170, 40, 50);
  
  tactile(225, 40, 25);
  fill(orange);
  circle(225, 40, 50);
  
  tactile(280, 40, 25);
  fill(yellow);
  circle(280, 40, 50);
  
  tactile(335, 40, 25);
  fill(green);
  circle(335, 40, 50);
  
  tactile(390, 40, 25);
  fill(blue);
  circle(390, 40, 50);
  
  tactile(445, 40, 25);
  fill(purple);
  circle(445, 40, 50);
  
  tactile(500, 40, 25);
  fill(black);
  circle(500, 40, 50);
  
  tactile(555, 40, 25);
  fill(white);
  circle(555, 40, 50);
  
  //new save load 
  tactilerect(10, 80, 60, 20);
  fill(200);
  rect(10, 80, 60, 20);
  fill(black);
  textSize(15);
  text("save", 25, 94);//save
  
  tactilerect(10, 105, 60, 20);
  fill(200);
  rect(10, 105, 60, 20);
  fill(black);
  textSize(15);
  text("load", 25, 120);//load
  
  tactilerect(10, 130, 60, 20);
  fill(200);
  rect(10, 130, 60, 20);
  fill(black);
  textSize(15);
  text("new", 26, 145);//new 
}

void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    strokeWeight(2);
    stroke(#FFFFFF);
  } else {
    strokeWeight(2);
    stroke(strokecolor);
  }
}

void tactilerect (int x, int y, int w, int h) {//detect if mouse is on button
  if (mouseX > x && mouseX < x + w &&
      mouseY > y && mouseY < y + h) {
    strokeWeight(2);
    stroke(#FFFFFF);
  } else {
    strokeWeight(2);
    stroke(strokecolor);
  }
}


void mouseDragged() {
  controlSlider();//if slider
  if (mouseX > leftBarW-10 && mouseY > topBarH-10 &&
      pmouseX > leftBarW-10 && pmouseY > topBarH-10 ) {//if within drawing range
    if (stampOn == false) {
      stroke(selectedColor);
      strokeWeight(map(sliderY, 170, 570, 20, 1));
      line(pmouseX, pmouseY, mouseX, mouseY);
    } else {
      image(stamp, mouseX-50, mouseY-50, 100, 100);
    }
  } 
}

void mouseReleased() {
  controlSlider();
  //stamp detect
  if (mouseX >15 && mouseX <65 &&
      mouseY >15 && mouseY <50) {
    stampOn = !stampOn;
  }
  // red
  if (dist(mouseX, mouseY, 170, 40) < 25) {
    selectedColor = red;
    stampOn = false;
  }
  // orange
  else if (dist(mouseX, mouseY, 225, 40) < 25) {
    selectedColor = orange;
    stampOn = false;
  }
  // yellow
  else if (dist(mouseX, mouseY, 280, 40) < 25) {
    selectedColor = yellow;
    stampOn = false;
  }
  // green
  else if (dist(mouseX, mouseY, 335, 40) < 25) {
    selectedColor = green;
    stampOn = false;
  }
  // blue
  else if (dist(mouseX, mouseY, 390, 40) < 25) {
    selectedColor = blue;
    stampOn = false;
  }
  // purple
  else if (dist(mouseX, mouseY, 445, 40) < 25) {
    selectedColor = purple;
    stampOn = false;
  }
  // black
  else if (dist(mouseX, mouseY, 500, 40) < 25) {
    selectedColor = black;
  }
  // white
  else if (dist(mouseX, mouseY, 555, 40) < 25) {
    selectedColor = white;
    stampOn = false;
  }
  if (mouseX > leftBarW && mouseY > topBarH &&
      pmouseX > leftBarW && pmouseY > topBarH) {
    if (stampOn == false) {
      stroke(selectedColor);
      strokeWeight(map(sliderY, 170, 570, 20, 1));
      line(pmouseX, pmouseY, mouseX, mouseY);
    } else {
      image(stamp, mouseX-50, mouseY-50, 100, 100);
    }
  } 
  if (mouseX > 10 && mouseY > 80 &&
      mouseX < 70 && mouseY < 100) {//save
     selectOutput("Choose a name for your new image file", "saveImage");
  }
  
  if (mouseX > 10 && mouseY > 105 &&
      mouseX < 70 && mouseY < 125) {//load
     selectInput("Pick an image to load", "openImage");
  }
  if (mouseX > 10 && mouseY > 130 &&
      mouseX < 70 && mouseY < 150) {//new
      noStroke();
      fill(white);
      rect(80, 80, 520, 520);
  }
}

void saveImage(File f) {
  if (f != null) {
    String path = f.getAbsolutePath();
    if (!path.toLowerCase().endsWith(".png")) {
      path = path + ".png";
    }
    PImage canvas = get(160, 160, 1040, 1040);
    canvas.save(path);
  }
}

void openImage(File f) {
  if (f != null) {
    int n = 0;
    while (n < 10) {
      PImage pic = loadImage (f.getPath());
      image(pic, 80, 80, 520, 520);
      n = n + 1;
    }
  }
}

void fillstampback() {
  if (stampOn == false) {
    fill(black);
  } else {
    fill(white);
  }
}

void controlSlider() {
  if (mouseY > 170 && mouseY < 570 &&
      mouseX > 25 && mouseX < 55) {
    sliderY = mouseY;
  }
}
