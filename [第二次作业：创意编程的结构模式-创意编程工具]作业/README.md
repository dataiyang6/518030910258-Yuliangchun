# 第二次作业
### 作业要求

- 熟悉processing中提供的绘图函数；
- 自行设计构形规则，利用processing中提供的绘图函数进行造型图案创作。

✏️简单描述你的创意内容，将程序运行结果附在这里。
### 作业说明
作业效果为一个逐渐微笑的笑脸。
#### 文件说明
“CreativeCoding_dataiyang_hw2”为工程文件夹，“CreativeCoding_dataiyang_hw2.pde”为作业代码；  
“hw2_smile.gif”为运行结果，“hw2_smile.png”为最终完整的笑脸。
#### 运行结果
hw2_smile.gif：   
<img src="https://github.com/dataiyang6/518030910258-Yuliangchun/blob/main/%5B%E7%AC%AC%E4%BA%8C%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E7%9A%84%E7%BB%93%E6%9E%84%E6%A8%A1%E5%BC%8F-%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E5%B7%A5%E5%85%B7%5D%E4%BD%9C%E4%B8%9A/hw2_smile.gif" width="75%">   
hw2_smile.png：  
<img src="https://github.com/dataiyang6/518030910258-Yuliangchun/blob/main/%5B%E7%AC%AC%E4%BA%8C%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E7%9A%84%E7%BB%93%E6%9E%84%E6%A8%A1%E5%BC%8F-%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E5%B7%A5%E5%85%B7%5D%E4%BD%9C%E4%B8%9A/hw2_smile.png" width="75%">

#### 代码
```
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
```
