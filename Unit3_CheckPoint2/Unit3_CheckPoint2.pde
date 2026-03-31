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
  square(50, 100, 100);

  tactile(100, 300, 50);
  fill(mediumblue);
  square(50, 250, 100);

  tactile(100, 450, 50);
  fill(darkblue);
  square(50, 400, 100);

  //indicator
  stroke(strokecolor);
  fill(selectedColor);
  square(200, 100, 400);
}//---------------------------------------------


void tactile (int x, int y, int s) {//----------
  if (mouseX > (x-s) && mouseX < (x+s) && mouseY > (y-s) && mouseY < (y+s)) {
    stroke(#FFFFFF);
  } else {
    stroke(strokecolor);
  }
}//---------------------------------------------


void mouseReleased() {//------------------------

  if (mouseX > 50 && mouseX < 150 && mouseY > 100 && mouseY < 200) {
    selectedColor = lightblue;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 250 && mouseY < 350) {
    selectedColor = mediumblue;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 400 && mouseY < 500) {
    selectedColor = darkblue;
  }
}//---------------------------------------------
