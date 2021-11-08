//hw2
//draw a smile

float pi=3.14;  //pi
float a=0;  //angle

void setup(){
  size(600, 600);
  background(255);
  
  //draw the smiling face
  fill(250,186,10,255);
  noStroke();
  ellipse(width/2,height/2,height/2,height/2); 
  
  //draw the eyes
  fill(0,0,0,255);
  noStroke();
  ellipse(width/2-height/8/1.414,height/2-height/8/1.414,height/14,height/14);
  ellipse(width/2+height/8/1.414,height/2-height/8/1.414,height/14,height/14);
}

void draw(){
  //draw the lip 
  noFill();
  stroke(0,0,0,255);
  strokeWeight(10);
  
  //a is used to change the radian of lip
  a+=pi/400;
  
  if(a>=pi/400*98 & a<=pi/400*99){//save png,I don't know how to save gif yet.
  save("hw2_smile.png");}
  
  if(a>=pi/400*99){  //when the lip completed,redraw 
    //print(a);
    stroke(250,186,10,255);
    strokeWeight(20);
    arc(width/2,height/2,height/4,height/4,0,pi);
  }
  else{
  arc(width/2,height/2,height/4,height/4,pi/4-a,pi*3/4+a);
  }
  a=a%(pi/4);
  
}
