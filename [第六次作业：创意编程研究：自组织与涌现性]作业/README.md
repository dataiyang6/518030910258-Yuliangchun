# 第六次作业

### 作业要求

创建您自己的基于粒子系统的可交互的动态创意作品，并输出为mp4/gif文件。作业（设计说明，源代码，视频/GIF文件）上传到GitHub账户，链接上传到canvas。

✏️使用readme.md进行作业介绍与说明，可通过图文等形式丰富readme.md中的内容
***
### 作业说明
鼠标点击和拖动查看效果。   
#### 文件说明
“CreativeCoding_dataiyang_hw6”为工程文件夹，“CreativeCoding_dataiyang_hw6.pde”和“Ball.pde”为作业代码；  
“hw6.gif”为运行结果。
#### 运行结果
<img src="https://user-images.githubusercontent.com/71808245/140854750-1e157da5-1395-4b78-9a24-f58a40e3c903.gif" width="75%">

#### 代码
CreativeCoding_dataiyang_hw6.pde：   
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

