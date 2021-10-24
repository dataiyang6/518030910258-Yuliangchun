//hw5
//the left buttons are for pattern,and the right ones are for color.

Button[] bt1,bt2;  //bt1 is pattern button,bt2 is color button.
color[] cc=new color[2];

float speed = 0;
float easing = 0.7;
float btWidth = 50;
float btHeight = 20;
color brushColor = 255;
boolean pattern=true;  //choose pattern


void setup() {
  size(600, 400);
  background(0);
  bt1 = new Button[2];
  bt2 = new Button[10];
  
  cc[0]=color(#0F70F5);
  cc[1]=color(#38AF0B);
  
  for (int i = 0; i < bt1.length; i ++) {
    bt1[i] = new Button(50, 50+(btHeight+10)*i, btWidth, btHeight, cc[i]);
  }
  
   for (int i = 0; i < bt2.length; i ++) {
    color cc = color(random(255), random(255), random(255));
    bt2[i] = new Button(width-btWidth-50, 50+(btHeight+10)*i, btWidth, btHeight, cc);
  }
  
}

void draw() {
  //background(255);
  pushStyle();//just for the display of button area
  fill(0);
  noStroke();
  rect(49, 0, btWidth+3, 150);
  rect(width-btWidth-51, 0, btWidth+3, 400);
  popStyle();

  if(pattern==true){
    pattern1();
  }else{
    pattern2();
  }

  chooseButton();
}

//choose and show buttons
void chooseButton(){
  for (int i = 0; i < bt1.length; i ++) {//judge pattern
    bt1[i].showButton();
    if (bt1[1].picked) {
      pattern=false;
    }else{
      pattern=true;
    }    
  }
  
  for (int i = 0; i < bt2.length; i ++) {//judge color
    bt2[i].showButton();
    if (bt2[i].pickColor) {
      brushColor = bt2[i].buttonColor;
      bt2[i].pickColor = false;
    }
  }
}

//pattern1 
void pattern1(){
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * easing;
  if (mousePressed) {
    strokeWeight(speed/2);
    stroke(brushColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

//pattern2 
void pattern2() {
  if (mousePressed){
    fill(brushColor, 200);
    noStroke();
    ellipse(mouseX, mouseY, 10, 10);
  }
}

void keyPressed(){ //save image and redraw
  if(key == 's'){
    save("hw5.png");
  }
  if(key == 'r'){
    background(0);
  }
}
