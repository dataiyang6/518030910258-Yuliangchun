# 第三次作业
### 作业要求

- 熟悉processing中提供的绘图函数；
- 分析理解彼埃·蒙德里安的作品风格和构图规则，创作类似彼埃·蒙德里安风格的作品，利用processing中提供的绘图函数进行创作实现。

✏️简单描述你的创意内容，将程序运行结果附在这里。
### 作业说明
<img src="https://github.com/dataiyang6/CreativeCodingHomework/blob/main/%5B%E7%AC%AC%E4%B8%89%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E5%85%83%E7%B4%A0%EF%BC%9A%E5%9B%BE%E5%BD%A2%5D%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%AD%A6%E4%B9%A0%E8%92%99%E5%BE%B7%E9%87%8C%E5%AE%89/hw3.png" width="50%">

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
