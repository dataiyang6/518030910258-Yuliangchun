# 第六次作业

### 作业要求

创建您自己的基于粒子系统的可交互的动态创意作品，并输出为mp4/gif文件。作业（设计说明，源代码，视频/GIF文件）上传到GitHub账户，链接上传到canvas。

### 作业说明
#### 功能和使用方法说明
鼠标点击画布和拖动查看效果。

#### 运行结果
<img src="https://github.com/dataiyang6/518030910258-Yuliangchun/blob/main/%5B%E7%AC%AC%E5%85%AD%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E7%A0%94%E7%A9%B6%EF%BC%9A%E8%87%AA%E7%BB%84%E7%BB%87%E4%B8%8E%E6%B6%8C%E7%8E%B0%E6%80%A7%5D%E4%BD%9C%E4%B8%9A/hw6.gif" width="50%">

#### 代码
dataiyang211031hw6：
```
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
```

Ball.pde：
```
class  Ball {
  float positionX;
  float positionY;
  float velocityX;
  float velocityY;
  color c;
  
  float dd;
  
  Ball() {
    positionX=mouseX;
    positionY=mouseY;
    velocityX=0;
    velocityY=0;
    c=color(random(100,200),random(100,120), random(100,250), random(180,250));
    dd=random(1, 30);
  }
  
  void update() {
    
    float accelerationX = 0, accelerationY = 0;
    //velocityX=0;
    //velocityY=0;
    
    for(Ball b : balls){
      float distanceX = b.positionX - positionX;
      float distanceY = b.positionY - positionY;
      float distance = sqrt(distanceX * distanceX + distanceY * distanceY);
      
      if (distance >0){
        if (distance < 1) distance = 1;
        
        float force = (distance - 300)*b.dd / distance;       
        accelerationX += force * distanceX;
        accelerationY += force * distanceY;
      } 

      velocityX = velocityX * 0.99 + accelerationX*dd/1000000;
      velocityY = velocityY * 0.99 + accelerationY*dd/1000000;

    }
    
    positionX += velocityX;
    positionY += velocityY;  

    fill(c);
    ellipse(positionX, positionY, dd, dd);
    
  }
  
}
```


