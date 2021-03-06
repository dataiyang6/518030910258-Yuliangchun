# 第五次作业
创建您自己的定制设计软件。

### 作业要求

- 至少有两个功能按钮，这些按钮的具体功能（如画笔样式、颜色、动作等）请自行设定；
- 利用这个工具绘制并导出一个美观的示例草图
- 通过readme.md说明这个定制设计软件的功能和使用方法。

✏️使用readme.md进行作业介绍与说明，可通过图文等形式丰富readme.md中的内容
***
### 作业说明
#### 功能和使用方法说明
项目包含两种按钮，左侧按钮为画笔样式选择，右侧按钮为画笔颜色选择。   
画笔样式默认为第一种；颜色种类每次随机生成，初次选择前为白色，选择后为所选择颜色。   
对于选择的按钮将有彩色方框显示。  
按下“s”键可保存png格式草图，按下“r”键将重置画布。   
#### 文件说明
“CreativeCoding_dataiyang_hw5”为工程文件夹，“CreativeCoding_dataiyang_hw5.pde”和“Button.pde”为作业代码；  
“hw5.png”为示例草图。
#### 示例草图
<img src="https://user-images.githubusercontent.com/71808245/140854509-aaa93d56-9435-4595-86cd-be9132f956a7.png" width="75%">

#### 代码
CreativeCoding_dataiyang_hw5.pde：   
```
//hw5
//the left buttons are for pattern,and the right ones are for color.

Button[] bt1,bt2;  //bt1 is pattern button,bt2 is color button.
color[] cc=new color[2];

float speed = 0;
float easing = 0.7;
float btWidth = 50;
float btHeight = 20;
color brushColor = 255;
boolean pattern=true;  //choose pattern


void setup() {
  size(600, 400);
  background(0);
  bt1 = new Button[2];
  bt2 = new Button[10];
  
  cc[0]=color(#0F70F5);
  cc[1]=color(#38AF0B);
  
  for (int i = 0; i < bt1.length; i ++) {
    bt1[i] = new Button(50, 50+(btHeight+10)*i, btWidth, btHeight, cc[i]);
  }
  
   for (int i = 0; i < bt2.length; i ++) {
    color cc = color(random(255), random(255), random(255));
    bt2[i] = new Button(width-btWidth-50, 50+(btHeight+10)*i, btWidth, btHeight, cc);
  }
  
}

void draw() {
  //background(255);
  pushStyle();//just for the display of button area
  fill(0);
  noStroke();
  rect(49, 0, btWidth+3, 150);
  rect(width-btWidth-51, 0, btWidth+3, 400);
  popStyle();

  if(pattern==true){
    pattern1();
  }else{
    pattern2();
  }

  chooseButton();
}

//choose and show buttons
void chooseButton(){
  for (int i = 0; i < bt1.length; i ++) {//judge pattern
    bt1[i].showButton();
    if (bt1[1].picked) {
      pattern=false;
    }else{
      pattern=true;
    }    
  }
  
  for (int i = 0; i < bt2.length; i ++) {//judge color
    bt2[i].showButton();
    if (bt2[i].pickColor) {
      brushColor = bt2[i].buttonColor;
      bt2[i].pickColor = false;
    }
  }
}

//pattern1 
void pattern1(){
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target - speed) * easing;
  if (mousePressed) {
    strokeWeight(speed/2);
    stroke(brushColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

//pattern2 
void pattern2() {
  if (mousePressed){
    fill(brushColor, 200);
    noStroke();
    ellipse(mouseX, mouseY, 10, 10);
  }
}

void keyPressed(){ //save image and redraw
  if(key == 's'){
    save("hw5.png");
  }
  if(key == 'r'){
    background(0);
  }
}
```

Button.pde：   
```
class Button {
  float posX, posY;
  float buttonWidth, buttonHeight;
  color buttonColor;
  boolean pickColor;
  boolean picked;

  Button(float x, float y, float w, float h, color c) {
    posX = x;
    posY = y;
    buttonWidth = w;
    buttonHeight = h;
    buttonColor = c;
  }

  void showButton() {
    
    //change the stroke according to choice.
    if (picked){
      stroke(#FF0307);
      strokeWeight(2);
    }else if (hover()) {
      stroke(255);
      strokeWeight(2);
    } else {
      noStroke();
    }
    
    if (mousePressed && hover()) {
      pickColor = true;
      picked = true;
      fill(buttonColor, 100);
    } else {
      fill(buttonColor);
    }
    
    //judge which button in bt1 is picked.
    for(Button tb1:bt1){
      if(tb1 ==this){
        for(Button tb:bt1){
          if(this.picked){
            if(tb !=this){
            tb.picked=false;
            } 
          }
        }
      }  
    }
    //judge which button in bt2 is picked.
    for(Button tb1:bt2){
      if(tb1 ==this){
        for(Button tb:bt2){
          if(this.picked){
            if(tb !=this){
            tb.picked=false;
            } 
          }
        }
      }  
    }
       
    rect(posX, posY, buttonWidth, buttonHeight);
  }

  boolean hover() {
    if (mouseX < posX + buttonWidth && mouseX > posX &&
      mouseY < posY + buttonHeight && mouseY > posY) {
      return true;
    } else {
      return false;
    }
  }
}
```
