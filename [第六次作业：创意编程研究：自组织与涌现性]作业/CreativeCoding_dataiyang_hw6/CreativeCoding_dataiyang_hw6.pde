//hw6

//import processing.video.*;
//Capture video;

Ball[] balls;

void setup(){
  size(600,600); 
  
  //video= new Capture(this, 600, 600);
  //video.start();
  
  noStroke();
  balls = new Ball[0];
}

//void captureEvent(Capture video) {
//  video.read();
//}

void draw(){
  background(0);
  
  for (int i = 0; i < balls.length; i ++) {
    balls[i].update();
  }
  
  if(balls.length>0)
  println(balls[0].velocityX,"balls.length",balls.length);
  
}

void NewBall() {
  balls = (Ball[])append(balls,new Ball());
}

void mouseClicked() {
  NewBall();
}

void mouseDragged() {
  NewBall();
}
