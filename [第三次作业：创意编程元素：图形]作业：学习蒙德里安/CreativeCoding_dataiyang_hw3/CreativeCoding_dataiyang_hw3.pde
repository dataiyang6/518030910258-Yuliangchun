//hw3

float hheight=0,wwidth=0;

void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  for (int i = 0; i<height; i+=hheight) {
    hheight=random(-height/5,height/5) +height/5;
    for (int j= 0; j<width; j+=wwidth) {
      wwidth=random(-height/4,height/4) +width/6;
      
      color ccolor;
      if(hheight*wwidth > random(0.1,1)*height*width/10){
        ccolor=int(random(100,200));
      }else{
        ccolor=255;
      }
 
      fill(ccolor);
      stroke(0);
      strokeWeight(8);
      rect(j, i, wwidth, hheight);
      }
  }
  save("hw3.png");
  // turn off looping so that the sketch is only drawn once
  noLoop();  
}

// use mousePressed to redraw
void mousePressed() {
  loop();
}
