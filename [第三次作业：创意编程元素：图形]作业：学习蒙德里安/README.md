# 第三次作业
### 作业要求

- 熟悉processing中提供的绘图函数；
- 分析理解彼埃·蒙德里安的作品风格和构图规则，创作类似彼埃·蒙德里安风格的作品，利用processing中提供的绘图函数进行创作实现。

✏️简单描述你的创意内容，将程序运行结果附在这里。
***
### 作业说明
#### 文件说明
“CreativeCoding_dataiyang_hw3”为工程文件夹，“CreativeCoding_dataiyang_hw3.pde”为作业代码；  
“hw3.png”为运行结果。
#### 运行结果
<img src="https://user-images.githubusercontent.com/71808245/140852966-477526b8-c172-4e81-add5-6ffb91f0e6ad.png" width="75%">

#### 代码
```
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
```
