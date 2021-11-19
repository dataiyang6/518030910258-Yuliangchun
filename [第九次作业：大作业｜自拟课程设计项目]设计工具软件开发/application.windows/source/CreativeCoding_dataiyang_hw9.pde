//hw9
//press key "space" to change the pattern,then press key "TAB" to change the mode.
//try to move or click the mouse to see the effect
//press "c" to redraw
//press "z" to show the original photo
//press "s" to save image

import processing.pdf.*;

PImage img;
boolean SaveImage;
boolean SavePDF;
float width1,height1;
int pattern=0,PatternNum=3,mode=0,Pattern1ModeNum=4,Pattern2ModeNum=2,Pattern3ModeNum=5;

ArrayList<Ball> balls;
//Ball[] balls;
PFont T;
Text text;
//String string1,string2;
int timedelay=80;
boolean textshow=true,originalPhotoShow=false;
String string1="Welcome";
String string2="Function "+(pattern%PatternNum+1)+"  Mode "+(mode+1);

void setup(){
  size(600,800);
  initiate();
}

void initiate(){
  background(255);
  img = loadImage("photo.png");
  //balls = new Ball[0];
  balls = new ArrayList<Ball>();
  text=new Text();
  frameCount=0;
  //loop();
}

void draw(){
  //background(255);
  
  width1=img.width;
  height1=img.height;
  
  if(width1>height1*1.2) width1=height1;
  
  img.loadPixels();

  if(frameCount<timedelay&&textshow){
    text.display();
  }else if((frameCount<timedelay+1) && textshow){
    initiate();
    textshow=false;
  }
  
  if(!textshow||frameCount>timedelay){
    
    switch(pattern%PatternNum){
    case 0:
      function1();
      break;
    case 1:
      function2();
      break;
    case 2:
      function3();
      break;
    }

    if(SaveImage == true){
      save("output/Function"+(pattern%PatternNum+1)+"_"+"Mode"+(mode+1)+"_"+hour()+"_"+minute()+"_"+second()+".png");
      SaveImage =false;
    }
  }
  
  if(originalPhotoShow){
    pushMatrix();
    scale(width/(width1),height/(height1));
    image(img,0,0);
    popMatrix();
  }
}

void modeUpdate(){
  mode++;
  switch(pattern%PatternNum){
  case 0:
    mode=mode%Pattern1ModeNum;
    break;
  case 1:
    mode=mode%Pattern2ModeNum;
    break;
  case 2:
    mode=mode%Pattern3ModeNum;
    break;
  }
}

void keyPressed(){ 
  if(key == 's'){    //save image
    SaveImage = true;    
  }
  if(key == TAB){   //change pattern
     modeUpdate();
     initiate();
     textshow=true;
     string1="key \"TAB\" is pressed. ";
     string2="Function "+(pattern%PatternNum+1)+"  Mode "+(mode+1);
  }  
  if(key == ' '){    //change mode
     pattern++;
     mode=0;
     initiate();
     textshow=true;
     string1="key \"space\" is pressed. ";
     string2="Function "+(pattern%PatternNum+1)+"  Mode "+(mode+1);
  }

  if(key == 'c'){   //redraw
     initiate();
  }
  if(key == 'z'){    //show original photo
    if(originalPhotoShow){
      originalPhotoShow=false;
      background(255);
    }else if(!originalPhotoShow) originalPhotoShow=true;
  }  
}
