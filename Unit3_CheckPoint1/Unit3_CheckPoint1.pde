//Melanie Liu
//2-1
//Mar 31, 2026
//Unit3 Check point-1

color babyblue = #E0F4FC;
color lightblue = #AADEF7;
color mediumblue = #6FB8DB;
color darkblue = #519DBF;
color strokecolor = #5E81AA;

color selectedColor;

void setup() {//--------------------------------
  size(650, 600);
  strokeWeight(5);
  stroke(strokecolor);
  selectedColor = darkblue;
}//---------------------------------------------

void draw() {//---------------------------------
  background(babyblue);
  
  //buttons
  tactile(100, 150, 50);
  fill(lightblue);
  circle(100, 150, 100);
  
  tactile(100, 300, 50);
  fill(mediumblue);
  circle(100, 300, 100);
  
  tactile(100, 450, 50);
  fill(darkblue);
  circle(100, 450, 100);
  
  //indicator
  stroke(strokecolor);
  fill(selectedColor);
  square(200, 100, 400);
}//---------------------------------------------


void tactile (int x, int y, int r) {
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(#FFFFFF);
  } else {
    stroke(strokecolor);
  }
}


void mouseReleased() {//------------------------

  if (dist(100, 150, mouseX, mouseY) < 50) {
    selectedColor = lightblue;
  }
  if (dist(100, 300, mouseX, mouseY) < 50) {
    selectedColor = mediumblue;
  }
  if (dist(100, 450, mouseX, mouseY) < 50) {
    selectedColor = darkblue;
  }
}//---------------------------------------------
