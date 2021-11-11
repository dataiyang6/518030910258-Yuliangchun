# 第七次作业

### 作业要求

结合课程案例，创建分形机制，建立一个具有生命特征/生态系统特征的可交互的动态创意作品，并输出为mp4/gif文件。作业（设计说明，源代码，视频/GIF文件）上传到GitHub，链接上传到canvas。

✏️使用readme.md进行作业介绍与说明，可通过图文等形式丰富readme.md中的内容
***
### 作业说明
#### 功能和使用方法说明
移动鼠标位置变换形状，点击鼠标改变树叶颜色。
#### 文件说明
“CreativeCoding_dataiyang_hw7”为工程文件夹，“CreativeCoding_dataiyang_hw7.pde”为作业代码；  
“hw7.gif”为运行结果。
#### 运行结果
<img src="https://github.com/dataiyang6/518030910258-Yuliangchun/blob/main/%5B%E7%AC%AC%E4%B8%83%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%88%9B%E6%84%8F%E7%BC%96%E7%A8%8B%E7%A0%94%E7%A9%B6%EF%BC%9A%E5%A4%8D%E6%9D%82%E6%80%A7%EF%BD%9C%E8%87%AA%E7%9B%B8%E4%BC%BC%E4%B8%8E%E5%88%86%E5%BD%A2%5D%E4%BD%9C%E4%B8%9A%EF%BC%9A%E8%87%AA%E7%9B%B8%E4%BC%BC%E4%B8%8E%E5%88%86%E5%BD%A2/hw7.gif" width="75%">

#### 代码

```
//hw7
float angleL ;
float angleR ;
float scaleL = 0.85;
float scaleR = 0.85;
color cl=(#F2204A);
color cl2=(#F5A1B6);

void setup() {
  size(800, 600);
}

void draw() {
  background(#B6DAEA);
  translate(width/2, height/2+300);
  Tree(10);
  
  float angle=map(mouseX, 0, width, 0, 360);
  float scale=map(mouseY, 0, height, 0, 180);
  
  angleL = map(cos(radians(angle)), -1, 1, radians(10), radians(28));
  angleR = map(sin(radians(angle)), -1, 1, radians(10), radians(28));  
  scaleL=map(cos(radians(scale)), -1, 1, 0.75, 0.88);
  scaleR=map(sin(radians(scale)), -1, 1, 0.75, 0.88);
}

void Tree(float level) {
  float dl=0.9;
  
  if (level>0) {
    strokeWeight(level+2);
    if (level>1.8) {
      stroke(#672B32);
    } else {
      stroke(#BF6C7C);
    }
    line(0, 0, 0, -80);
    if (level < 1){
      fill(cl);
      noStroke();
      ellipse(0,-110,20,40);
    }
    translate(0, -80);
    
    pushMatrix();
    cl=(#F2204A);
    rotate(-angleL);
    scale(scaleL);
    Tree(level-dl);
    popMatrix();

    pushMatrix();
    cl=cl2;
    rotate(angleR);
    scale(scaleR);
    Tree(level-dl);
    popMatrix();
  }
}

void mousePressed(){
  cl2=color(227,random(60,160),153);
}
```


