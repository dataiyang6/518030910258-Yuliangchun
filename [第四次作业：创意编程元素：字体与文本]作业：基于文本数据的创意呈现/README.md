# 第四次作业
### 作业要求
#### 1.选择一段文本，根据你的创意进行演绎规则的设计，实现对文本内容的图形化呈现。
#### 2.通过网站检索文本可视化项目，从中找出你所喜欢的作品，形式不限，可以是海报、动画、交互媒体和装置。归纳一些应用文字创作图形作品的方法和思路，并进行案例整理，具体包括：

- 项目名称
- 作者/艺术家名称
- 来源/出处（URL等）
- 概要描述（文字描述）
- 截图/视频素材

✏️简单描述你的创意内容，将程序运行结果附在这里。
***
### 作业说明
点击鼠标改变效果。
#### 文件说明
“CreativeCoding_dataiyang_hw4”为工程文件夹，“CreativeCoding_dataiyang_hw4.pde”为作业代码；  
“hw4.gif”和“hw4.png”为运行结果，两者一致，仅文件类型不同；   
“hw4_case.gif”和“hw4_case.png”为文本可视化项目，两者一致，仅文件类型不同。
#### 运行结果
<!-- ![](https://github.com/dataiyang6/CreativeCodingHomework/blob/main/HW4/hw4.png) -->
hw4.gif：   
<img src="https://user-images.githubusercontent.com/71808245/140854031-48abc709-f709-45f9-8fa6-e63f26b28cde.gif" width="75%">   
hw4.png：   
<img src="https://user-images.githubusercontent.com/71808245/140854039-4ad8b355-3c7e-4c38-983e-46bc80cac30c.png" width="75%">

#### 代码
```
//hw4
PFont font;
String txt= "create";

void setup(){
  size(600,600);
  background(255);

  font = createFont("Arial",24);
  frameRate(5);
}

void draw(){
  background(255);
  textFont(font);
  textSize(125);
 
  color thecolor=color(85,210,215);
  float tHeight = 0;
  float tHeight2 = 0;
  float ttW = textWidth(txt);
  float tH=0;
  
  for(int i = 0; i < txt.length(); i ++){
    tH =random(120,122);
    
    //use mousePressed to change
    if(mousePressed == true){
      tHeight =random(-height/5,height/5);
      thecolor =color(random(0,255),random(0,255),random(0,255));
      tH =tH*random(0.5,1.2);
    }else{
      tHeight = 0;
      thecolor=color(85,210,215);
    }
    
    textSize(tH);
    fill(thecolor);
    char c = txt.charAt(i);
    float tW = textWidth(c);
    println(tW);
    text(c,width/2-ttW*3/4+tHeight2+tW*random(0,0.5),height/2+tHeight);
    tHeight += tW;
    tHeight2 += tW*1.5;
  }    
}
```
### 文本可视化项目:
项目名称：201204a   
作者：takawo   
来源：https://openprocessing.org/sketch/1033440   
描述：不同的文字从顶部掉落。   
素材：   
hw4_case.gif：    
<img src="https://github.com/dataiyang6/518030910258-Yuliangchun/blob/main/%5B%E7%AC%AC%E5%9B%9B%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E5%85%83%E7%B4%A0%EF%BC%9A%E5%AD%97%E4%BD%93%E4%B8%8E%E6%96%87%E6%9C%AC%5D%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%9F%BA%E4%BA%8E%E6%96%87%E6%9C%AC%E6%95%B0%E6%8D%AE%E7%9A%84%E5%88%9B%E6%84%8F%E5%91%88%E7%8E%B0/hw4_case.gif" width="75%">  
![Uploading hw4_case.gif…]()

hw4_case.png：   
<img src="https://user-images.githubusercontent.com/71808245/140854199-c991254b-e48d-498d-be51-8c34ff3fe3e1.png" width="75%">

