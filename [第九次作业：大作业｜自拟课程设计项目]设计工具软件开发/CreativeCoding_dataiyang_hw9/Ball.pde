class Ball{
  PVector location;
  float radius,xOff,yOff;
  color c;
  float nX,nY;
  float t;
  
  Ball(int mX, int mY, color cc){
    location = new PVector(mX, mY);
    switch(mode%Pattern1ModeNum){
    case 0:
      radius = 50;
      break;
    case 1:
      radius = 30;
      break;
    case 2:
      radius = random(10, 20);
      break;
    case 3:
      radius = random(0, 3);
      break;
    }
    
    this.t = random(0, 0.01);
    
    c=cc;
    xOff = 0.0;
    yOff = 0.0;
  }
  
  void run(){
    show();  
    update();
    changeColour();
  }

  void update(){
    xOff = xOff + random(-0.5,0.5);
    nX = noise(location.x) * xOff;
    yOff = yOff + random(-.5, .5);
    nY = noise(location.y) * yOff;
    
    switch(mode%Pattern1ModeNum){
    case 0:
      //radius -= random(0.05, 0.25);
      radius -= random(0.0, 0.1);
      float theta = map(noise(this.location.x * 0.002, this.location.y * 0.002), 0, 1, -360, 360);
      //println(theta);
      location.x += cos(theta)*2;
      location.y += sin(theta)*2;
      break;
    case 1:
      radius -= random(0.0, 0.15);
      float theta1 = map(noise(this.location.x * 0.1, this.location.y * 0.1), 0, 1, -360, 360);
      location.x += cos(theta1)*10;
      location.y += sin(theta1)*10;
      break;
    case 2:
      radius -= random(0.05, 0.25);
      location.x += nX;
      location.y += nY;
      break;      
    case 3:
      radius -= random(0.02);
      location.x += nX;
      location.y += nY;
      break;
    }
    
  }

  void changeColour(){
    c = color(img.get(int(location.x), int(location.y)));
  }

  void show(){
    noStroke();
    fill(c);
    ellipse(location.x,location.y,radius,radius);
    //println(radius);
  }
}
