//Melanie Liu
//2-1
//Apr 1, 2026
//Unit3 Check point-3

float sliderY;
int size;

void setup () {//--------------------------------
  size(600, 600);
  sliderY = 300;
  size = 50;
}//----------------------------------------------

void draw() {//----------------------------------
  background (#FFFFFF);
  fill(#FFFFFF);
  
  //slider
  strokeWeight(10);
  line(100, 100, 100, 500);
  circle(100, sliderY, 50);
  
  //circle that change shape
  circle(350, 300, (600-sliderY)/1.5);
  /*
  guidelines();
  */
}//----------------------------------------------

void mouseDragged() {//--------------------------
  controlSlider();
}//----------------------------------------------

void mouseReleased() {//-------------------------
  controlSlider();
}//----------------------------------------------

void controlSlider() {//-------------------------
  if (mouseY > 100 && mouseY < 500 && mouseX > 40 && mouseX < 160) {
    sliderY = mouseY;
  }  
}//----------------------------------------------

/*
void guidelines() {
  strokeWeight(1);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  fill(#000000);
  text("(" + mouseX + ", " + mouseY + ")", mouseX+20, mouseY+20);
}
*/
